#region

using System;
using System.Collections;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using Microsoft.EntityFrameworkCore;
using Npgsql;
using NpgsqlTypes;

#endregion

namespace ReAl.Lumino.Encuestas.Dal
{
    public class CConn
    {
        internal NpgsqlConnection ConexionBd = new NpgsqlConnection();

        private static readonly EnumTipoConexion TipoConexion = EnumTipoConexion.UseDataReader;
        private enum EnumTipoConexion
        {
            UseDataAdapter,
            UseDataReader
        }

        /// <summary>
        ///   Constructor de la Clase que se encarga de configurar la Cadena de Conexion
        /// </summary>
        public CConn(string strConn)
        {
            ConexionBd.ConnectionString = strConn;            
        }

        /// <summary>
        ///   Función que devuelve un DataTable a partir de la ejecución de una consulta [SQL]
        /// </summary>
        /// <param name="query" type="string">
        ///   <para>
        ///     Consulta a la Base de Datos
        ///   </para>
        /// </param>
        /// <returns>
        ///   DataTable con el resultado de la ejecución del Query
        /// </returns>
        private DataTable CargarDataTable(string query)
        {
            var dt = new DataTable();

            dt.Clear();
            try
            {
                var command = new NpgsqlCommand(query, ConexionBd);

                if (TipoConexion == EnumTipoConexion.UseDataReader)
                {
                    if (command.Connection.State == ConnectionState.Closed)
                    {
                        command.Connection.Open();
                    }
                    DbDataReader dr = command.ExecuteReader(CommandBehavior.CloseConnection);
                    dt.Load(dr);
                    dr.Close();
                    if (command.Connection.State != ConnectionState.Closed)
                    {
                        command.Connection.Close();
                    }
                }
                else
                {
                    var da = new NpgsqlDataAdapter();
                    da = new NpgsqlDataAdapter(command);
                    da.Fill(dt);
                }
                command.Dispose();
            }
            catch (Exception ex)
            {
                ex.Data.Add("Query: ", query);
                throw;
            }
            return dt;
        }

        /// <summary>
        ///   Función que devuelve un DataTable a partir de la ejecución de una consulta [SQL]
        /// </summary>
        /// <param name="query" type="string">
        ///   <para>
        ///     Consulta a la Base de Datos
        ///   </para>
        /// </param>
        /// <param name="trans" type="Conexion.cTrans">
        ///   <para>
        ///     Objeto que contiene la Transaccion activa utilizada para realizar la operacion
        ///   </para>
        /// </param>
        /// <returns>
        ///   DataTable con el resultado de la ejecución del Query
        /// </returns>
        private DataTable CargarDataTable(string query, ref CTrans trans)
        {
            var dt = new DataTable();
            dt.Clear();
            try
            {
                var command = new NpgsqlCommand(query, trans.MyConn);
                command.Transaction = trans.MyTrans;

                if (TipoConexion == EnumTipoConexion.UseDataReader)
                {
                    if (command.Connection.State == ConnectionState.Closed)
                    {
                        command.Connection.Open();
                    }
                    var dr = (NpgsqlDataReader)command.ExecuteReader(CommandBehavior.Default);
                    dt.Load(dr);
                    dr.Close();
                }
                else
                {
                    var da = new NpgsqlDataAdapter();
                    da = new NpgsqlDataAdapter(command);
                    da.Fill(dt);
                }
                command.Dispose();
            }
            catch (Exception ex)
            {
                ex.Data.Add("Query en cargarDataTable", query);
                throw;
            }
            return dt;
        }

        /// <summary>
        ///   Función que devuelve un DataTable a partir de la ejecución de una consulta [SQL]
        /// </summary>
        /// <param name="query" type="string">
        ///   <para>
        ///     Consulta a la Base de Datos
        ///   </para>
        /// </param>
        /// <returns>
        ///   DbDataReader con el resultado de la ejecución del Query
        /// </returns>
        private DbDataReader CargarDataReader(string query)
        {
            DbDataReader dr = null;
            try
            {
                var command = new NpgsqlCommand(query, ConexionBd);
                command.Connection.Open();

                dr = (DbDataReader)command.ExecuteReader(CommandBehavior.CloseConnection);
                dr.Close();
                if (command.Connection.State != ConnectionState.Closed)
                {
                    command.Connection.Close();
                }
                command.Dispose();
            }
            catch (Exception ex)
            {
                ex.Data.Add("cargarDataReader: ", query);
                throw;
            }
            return dr;
        }

        /// <summary>
        ///   Función que devuelve un DataTable a partir de la ejecución de una consulta [SQL]
        /// </summary>
        /// <param name="query" type="string">
        ///   <para>
        ///     Consulta a la Base de Datos
        ///   </para>
        /// </param>
        /// <param name="trans" type="Conexion.cTrans">
        ///   <para>
        ///     Objeto que contiene la Transaccion activa utilizada para realizar la operacion
        ///   </para>
        /// </param>
        /// <returns>
        ///   DataTable con el resultado de la ejecución del Query
        /// </returns>
        private DbDataReader CargarDataReader(string query, ref CTrans trans)
        {
            DbDataReader dr = null;
            try
            {
                var command = new NpgsqlCommand(query, trans.MyConn);
                command.Transaction = trans.MyTrans;

                if (command.Connection.State == ConnectionState.Closed)
                {
                    command.Connection.Open();
                }
                dr = (NpgsqlDataReader)command.ExecuteReader(CommandBehavior.Default);
                dr.Close();

                command.Dispose();
            }
            catch (Exception ex)
            {
                ex.Data.Add("Query en cargarDataReader", query);
                throw;
            }
            return dr;
        }

        /// <summary>
        ///   Función que ejecuta un Query
        /// </summary>
        /// <param name="query" type="string">
        ///   <para>
        ///     Query para ejecutarse
        ///   </para>
        /// </param>
        /// <returns>
        ///   Registros afectados por la ejecución del query [SQL]
        /// </returns>
        private int Ejecutar(string query)
        {
            try
            {
                if (ConexionBd.State == ConnectionState.Closed)
                {
                    ConexionBd.Open();
                }
                
                var command = new NpgsqlCommand(query, ConexionBd);
                var numReg = command.ExecuteNonQuery();
                ConexionBd.Close();
                command.Connection.Close();
                command.Dispose();
                return numReg;
            }
            catch (Exception ex)
            {
                ex.Data.Add("Query en Ejecutar", query);
                throw;
            }
        }

        /// <summary>
        ///   Función que ejecuta un Query
        /// </summary>
        /// <param name="query" type="string">
        ///   <para>
        ///     Query para ejecutarse
        ///   </para>
        /// </param>
        /// <param name="trans" type="Conexion.cTrans">
        ///   <para>
        ///     Objeto que contiene la Transaccion activa utilizada para realizar la operacion
        ///   </para>
        /// </param>
        /// <returns>
        ///   Registros afectados por la ejecución del query [SQL]
        /// </returns>
        private int Ejecutar(string query, ref CTrans trans)
        {
            try
            {
                var command = new NpgsqlCommand(query, trans.MyConn);
                command.Transaction = trans.MyTrans;
                var numReg = command.ExecuteNonQuery();
                command.Dispose();
                ConexionBd.Close();
                return numReg;
            }
            catch (Exception ex)
            {
                ex.Data.Add("Query en Ejecutar", query);
                throw;
            }
        }

        /// <summary>
        ///   Metodo que ejecuta un Procedimiento Almacenado
        /// </summary>
        /// <param name="nombreSp" type="string">
        ///   <para>
        ///     Nombre del Stored procedure
        ///   </para>
        /// </param>        
        /// <returns>
        ///   Devuelve TRUE o FALSE dependiendo del éxito de la Operacion
        /// </returns>
        public bool ExecStoreProcedure(string nombreSp)
        {
            var command = new NpgsqlCommand();
            command.CommandText = nombreSp;
            command.CommandType = CommandType.StoredProcedure;

            try
            {
                command.Connection = ConexionBd;
                command.ExecuteNonQuery();
                command.Connection.Close();
                command.Dispose();
                return true;
            }
            catch (Exception ex)
            {
                ex.Data.Add("StoredProcedure", nombreSp);
                throw;
            }
        }

        /// <summary>
        ///   Metodo que ejecuta un Procedimiento Almacenado
        /// </summary>
        /// <param name="nombreSp" type="string">
        ///   <para>
        ///     Nombre del Stored procedure
        ///   </para>
        /// </param>
        /// <param name="myTrans" type="Conexion.cTrans">
        ///   <para>
        ///     Objeto que contiene la Transaccion activa utilizada para realizar la operacion
        ///   </para>
        /// </param>
        /// <returns>
        ///   Devuelve TRUE o FALSE dependiendo del éxito de la Operacion
        /// </returns>
        public bool ExecStoreProcedure(string nombreSp, ref CTrans myTrans)
        {
            var command = new NpgsqlCommand();
            command.CommandText = nombreSp;
            command.CommandType = CommandType.StoredProcedure;

            try
            {
                command.Connection = myTrans.MyConn;
                command.ExecuteNonQuery();
                command.Dispose();
                return true;
            }
            catch (Exception ex)
            {
                ex.Data.Add("StoredProcedure", nombreSp);
                throw;
            }
        }


        #region CargarDataTables
        /// <summary>
        ///   Función que devuelve un DataTable a partir de la ejecución de una consulta [SQL]
        /// </summary>
        /// <param name="tabla" type="string">
        ///   <para>
        ///     Consulta a la Base de Datos
        ///   </para>
        /// </param>
        /// <param name="arrColumnas" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los valores de las columnas en la consulta [SQL]
        ///   </para>
        /// </param>
        /// <returns>
        ///   DataTable con el resultado de la ejecución del Query
        /// </returns>
        internal DataTable CargarDataTable(string tabla, ArrayList arrColumnas)
        {
            var arrColWhere = new ArrayList();
            arrColWhere.Add("1");

            return CargarDataTableAnd(tabla, arrColumnas, arrColWhere, arrColWhere, "");
        }

        /// <summary>
        ///   Función que devuelve un DataTable a partir de la ejecución de una consulta [SQL]
        /// </summary>
        /// <param name="tabla" type="string">
        ///   <para>
        ///     Nombre de la Tabla
        ///   </para>
        /// </param>
        /// <param name="arrColumnas" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los valores de las columnas en la consulta [SQL]
        ///   </para>
        /// </param>
        /// <param name="trans" type="Conexion.cTrans">
        ///   <para>
        ///     Objeto que contiene la Transaccion activa utilizada para realizar la operacion
        ///   </para>
        /// </param>
        /// <returns>
        ///   DataTable con el resultado de la ejecución del Query
        /// </returns>
        internal DataTable CargarDataTable(string tabla, ArrayList arrColumnas, ref CTrans trans)
        {
            var arrColWhere = new ArrayList {"1"};
            return CargarDataTableAnd(tabla, arrColumnas, arrColWhere, arrColWhere, "", ref trans);
        }

        /// <summary>
        ///   Función que devuelve un DataTable a partir de la ejecución de una consulta [SQL]
        /// </summary>
        /// <param name="tabla" type="string">
        ///   <para>
        ///     Nombre de la Tabla
        ///   </para>
        /// </param>
        /// <param name="arrColumnas" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los valores de las columnas en la consulta [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrColumnasWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrValoresWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a los valores de las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <returns>
        ///   DataTable con el resultado de la ejecución del Query
        /// </returns>
        internal DataTable CargarDataTableAnd(string tabla, ArrayList arrColumnas, ArrayList arrColumnasWhere,
                                            ArrayList arrValoresWhere)
        {
            return CargarDataTableAnd(tabla, arrColumnas, arrColumnasWhere, arrValoresWhere, "");            
        }

		/// <summary>
        /// Funcion que devuelve un DataTable a partir del nombre de una tabla y las columnas
        /// </summary>
        /// <param name="tabla">Nombre de la tabla</param>
        /// <param name="arrColumnas">Coleccion de objetos referidad a los valores de las columnas en la consulta [SQL]</param>
        /// <returns>DataTabl con las columnas especificadas</returns>
        internal DataTable CargarDataTableAnd(string tabla, ArrayList arrColumnas)
        {
            var arrColWhere = new ArrayList {"1"};
            return CargarDataTableAnd(tabla, arrColumnas, arrColWhere, arrColWhere, "");
        }

        /// <summary>
        ///   Función que devuelve un DataTable a partir de la ejecución de una consulta [SQL]
        /// </summary>
        /// <param name="tabla" type="string">
        ///   <para>
        ///     Nombre de la Tabla
        ///   </para>
        /// </param>
        /// <param name="arrColumnas" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los valores de las columnas en la consulta [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrColumnasWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrValoresWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a los valores de las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="trans" type="Conexion.cTrans">
        ///   <para>
        ///     Objeto que contiene la Transaccion activa utilizada para realizar la operacion
        ///   </para>
        /// </param>
        /// <returns>
        ///   DataTable con el resultado de la ejecución del Query
        /// </returns>
        internal DataTable CargarDataTableAnd(string tabla, ArrayList arrColumnas, ArrayList arrColumnasWhere,
                                            ArrayList arrValoresWhere, ref CTrans trans)
        {
            return CargarDataTableAnd(tabla, arrColumnas, arrColumnasWhere, arrValoresWhere, "", ref trans);            
        }

        /// <summary>
        ///   Función que devuelve un DataTable a partir de la ejecución de una consulta [SQL]
        /// </summary>
        /// <param name="tabla" type="string">
        ///   <para>
        ///     Nombre de la Tabla
        ///   </para>
        /// </param>
        /// <param name="arrColumnas" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los valores de las columnas en la consulta [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrColumnasWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrValoresWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a los valores de las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="sParametrosAdicionales" type="string">
        ///   <para>
        ///     Parametros adicionales de la Consulta
        ///   </para>
        /// </param>
        /// <returns>
        ///   DataTable con el resultado de la ejecución del Query
        /// </returns>
        internal DataTable CargarDataTableAnd(string tabla, ArrayList arrColumnas, ArrayList arrColumnasWhere,
                                            ArrayList arrValoresWhere, string sParametrosAdicionales)
        {
            var query = new StringBuilder();
            query.AppendLine("SELECT ");
            var primerReg = true;
            foreach (string columna in arrColumnas)
            {
                if (primerReg)
                {
                    query.AppendLine(columna);
                    primerReg = false;
                }
                else
                {
                    query.AppendLine(", " + columna);
                }
            }
            query.AppendLine(" FROM " + tabla + " WHERE ");

            var boolBandera = false;
            for (var intContador = 0; intContador < arrValoresWhere.Count; intContador++)
            {
                if (boolBandera)
                {
                    query.AppendLine(" AND " + arrColumnasWhere[intContador] + " = " + arrValoresWhere[intContador]);
                }
                else
                {
                    query.AppendLine(arrColumnasWhere[intContador] + " = " + arrValoresWhere[intContador]);
                    boolBandera = true;
                }
            }
            query.AppendLine(sParametrosAdicionales);

            try
            {
                return CargarDataTable(query.ToString());
            }
            catch (Exception ex)
            {
                ex.Data.Add("Query en cargarDataTableAnd", query);
                throw;
            }
        }

        /// <summary>
        ///   Función que devuelve un DataTable a partir de la ejecución de una consulta [SQL]
        /// </summary>
        /// <param name="tabla" type="string">
        ///   <para>
        ///     Nombre de la Tabla
        ///   </para>
        /// </param>
        /// <param name="arrColumnas" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los valores de las columnas en la consulta [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrColumnasWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrValoresWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a los valores de las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="sParametrosAdicionales" type="string">
        ///   <para>
        ///     Parametros Adicionales
        ///   </para>
        /// </param>
        /// <param name="trans" type="Conexion.cTrans">
        ///   <para>
        ///     Objeto que contiene la Transaccion activa utilizada para realizar la operacion
        ///   </para>
        /// </param>
        /// <returns>
        ///   DataTable con el resultado de la ejecución del Query
        /// </returns>
        internal DataTable CargarDataTableAnd(string tabla, ArrayList arrColumnas, ArrayList arrColumnasWhere,
                                            ArrayList arrValoresWhere, string sParametrosAdicionales, ref CTrans trans)
        {
            var query = new StringBuilder();
            query.AppendLine("SELECT ");
            var primerReg = true;
            foreach (string columna in arrColumnas)
            {
                if (primerReg)
                {
                    query.AppendLine(columna);
                    primerReg = false;
                }
                else
                {
                    query.AppendLine(", " + columna);
                }
            }
            query.AppendLine(" FROM " + tabla + " WHERE ");

            var boolBandera = false;
            for (var intContador = 0; intContador < arrValoresWhere.Count; intContador++)
            {
                if (boolBandera)
                {
                    query.AppendLine(" AND " + arrColumnasWhere[intContador] + " = " + arrValoresWhere[intContador]);
                }
                else
                {
                    query.AppendLine(arrColumnasWhere[intContador] + " = " + arrValoresWhere[intContador]);
                    boolBandera = true;
                }
            }
            query.AppendLine(sParametrosAdicionales);

            try
            {
                return CargarDataTable(query.ToString(), ref trans);
            }
            catch (Exception ex)
            {
                ex.Data.Add("Query en cargarDataTableAnd", query);
                throw;
            }
        }
        
		/// <summary>
        ///   Función que devuelve un DataTable a partir de la ejecución de una consulta [SQL] con encadenadores LIKE
        /// </summary>
        /// <param name="tabla" type="string">
        ///   <para>
        ///     Nombre de la Tabla
        ///   </para>
        /// </param>
        /// <param name="arrColumnas" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los valores de las columnas en la consulta [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrColumnasWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrValoresWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a los valores de las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="strParamAdicionales" type="string">
        ///   <para>
        ///     Parametros Adicionales
        ///   </para>
        /// </param>        
        /// <returns>
        ///   DataTable con el resultado de la ejecución del Query
        /// </returns>
        internal DataTable CargarDataTableLike(string tabla, ArrayList arrColumnas, ArrayList arrColumnasWhere,
                                             ArrayList arrValoresWhere, string strParamAdicionales)
		{
		    var query = new StringBuilder();
            query.Append("SELECT ");
            var primerReg = true;
            foreach (string columna in arrColumnas)
            {
                if (primerReg)
                {
                    query.AppendLine(columna);
                    primerReg = false;
                }
                else
                {
                    query.AppendLine(", " + columna);
                }
            }
            query.AppendLine(" FROM " + tabla + " WHERE ");

            var boolBandera = false;
            for (var intContador = 0; intContador < arrValoresWhere.Count; intContador++)
            {
                if (boolBandera)
                {
                    query.AppendLine(" AND " + arrColumnasWhere[intContador] + " LIKE " + arrValoresWhere[intContador]);
                }
                else
                {
                    query.AppendLine(arrColumnasWhere[intContador] + " = " + arrValoresWhere[intContador]);
                    boolBandera = true;
                }
            }
            query.AppendLine(strParamAdicionales);

            try
            {
                return CargarDataTable(query.ToString());
            }
            catch (Exception ex)
            {
                ex.Data.Add("Query en cargarDataTableAnd", query);
                throw;
            }
        }

        

        /// <summary>
        ///   Función que devuelve un DataTable a partir de la ejecución de una consulta [SQL]
        /// </summary>
        /// <param name="tabla" type="string">
        ///   <para>
        ///     Nombre de la Tabla
        ///   </para>
        /// </param>
        /// <param name="arrColumnas" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los valores de las columnas en la consulta [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrColumnasWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrValoresWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a los valores de las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <returns>
        ///   DataTable con el resultado de la ejecución del Query
        /// </returns>
        internal DataTable CargarDataTableOr(string tabla, ArrayList arrColumnas, ArrayList arrColumnasWhere,
                                           ArrayList arrValoresWhere)
        {
            return CargarDataTableOr(tabla, arrColumnas, arrColumnasWhere, arrValoresWhere, "");            
        }

        /// <summary>
        ///   Función que devuelve un DataTable a partir de la ejecución de una consulta [SQL]
        /// </summary>
        /// <param name="tabla" type="string">
        ///   <para>
        ///     Nombre de la Tabla
        ///   </para>
        /// </param>
        /// <param name="arrColumnas" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los valores de las columnas en la consulta [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrColumnasWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrValoresWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a los valores de las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="trans" type="Conexion.cTrans">
        ///   <para>
        ///     Objeto que contiene la Transaccion activa utilizada para realizar la operacion
        ///   </para>
        /// </param>
        /// <returns>
        ///   DataTable con el resultado de la ejecución del Query
        /// </returns>
        internal DataTable CargarDataTableOr(string tabla, ArrayList arrColumnas, ArrayList arrColumnasWhere,
                                           ArrayList arrValoresWhere, ref CTrans trans)
        {
            return CargarDataTableOr(tabla, arrColumnas, arrColumnasWhere, arrValoresWhere, "", ref trans);            
        }

        /// <summary>
        ///   Función que devuelve un DataTable a partir de la ejecución de una consulta [SQL]
        /// </summary>
        /// <param name="tabla" type="string">
        ///   <para>
        ///     Nombre de la Tabla
        ///   </para>
        /// </param>
        /// <param name="arrColumnas" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los valores de las columnas en la consulta [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrColumnasWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrValoresWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a los valores de las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="sParametrosAdicionales" type="string">
        ///   <para>
        ///     Parametros adicionales de la Consulta
        ///   </para>
        /// </param>
        /// <returns>
        ///   DataTable con el resultado de la ejecución del Query
        /// </returns>
        internal DataTable CargarDataTableOr(string tabla, ArrayList arrColumnas, ArrayList arrColumnasWhere,
                                           ArrayList arrValoresWhere, string sParametrosAdicionales)
        {
            var query = new StringBuilder();
            query.AppendLine("SELECT ");
            var primerReg = true;
            foreach (string columna in arrColumnas)
            {
                if (primerReg)
                {
                    query.AppendLine(columna);
                    primerReg = false;
                }
                else
                {
                    query.AppendLine(", " + columna);
                }
            }
            query.AppendLine(" FROM " + tabla + " WHERE ");

            var boolBandera = false;
            for (var intContador = 0; intContador < arrValoresWhere.Count; intContador++)
            {
                if (boolBandera)
                {
                    query.AppendLine(" OR " + arrColumnasWhere[intContador] + " = " + arrValoresWhere[intContador]);
                }
                else
                {
                    query.AppendLine(arrColumnasWhere[intContador] + " = " + arrValoresWhere[intContador]);
                    boolBandera = true;
                }
            }
            query.AppendLine(sParametrosAdicionales);

            try
            {
                return CargarDataTable(query.ToString());
            }
            catch (Exception ex)
            {
                ex.Data.Add("Query en cargarDataTableOr", query);
                throw;
            }
        }

        /// <summary>
        ///   Función que devuelve un DataTable a partir de la ejecución de una consulta [SQL]
        /// </summary>
        /// <param name="tabla" type="string">
        ///   <para>
        ///     Nombre de la Tabla
        ///   </para>
        /// </param>
        /// <param name="arrColumnas" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los valores de las columnas en la consulta [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrColumnasWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrValoresWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a los valores de las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="sParametrosAdicionales" type="string">
        ///   <para>
        ///     Parametros Adicionales
        ///   </para>
        /// </param>
        /// <param name="trans" type="Conexion.cTrans">
        ///   <para>
        ///     Objeto que contiene la Transaccion activa utilizada para realizar la operacion
        ///   </para>
        /// </param>
        /// <returns>
        ///   DataTable con el resultado de la ejecución del Query
        /// </returns>
        internal DataTable CargarDataTableOr(string tabla, ArrayList arrColumnas, ArrayList arrColumnasWhere,
                                           ArrayList arrValoresWhere, string sParametrosAdicionales, ref CTrans trans)
        {
            var query = new StringBuilder();
            query.AppendLine("SELECT ");
            var primerReg = true;
            foreach (string columna in arrColumnas)
            {
                if (primerReg)
                {
                    query.AppendLine(columna);
                    primerReg = false;
                }
                else
                {
                    query.AppendLine(", " + columna);
                }
            }
            query.AppendLine(" FROM " + tabla + " WHERE ");

            var boolBandera = false;
            for (var intContador = 0; intContador < arrValoresWhere.Count; intContador++)
            {
                if (boolBandera)
                {
                    query.AppendLine(" OR " + arrColumnasWhere[intContador] + " = " + arrValoresWhere[intContador]);
                }
                else
                {
                    query.AppendLine(arrColumnasWhere[intContador] + " = " + arrValoresWhere[intContador]);
                    boolBandera = true;
                }
            }
            query.AppendLine(sParametrosAdicionales);

            try
            {
                return CargarDataTable(query.ToString(), ref trans);
            }
            catch (Exception ex)
            {
                ex.Data.Add("Query en cargarDataTableOr", query);
                throw;
            }
        }

        #endregion

        #region Cargar DataReaders
        /// <summary>
        ///   Función que devuelve un DataTable a partir de la ejecución de una consulta [SQL]
        /// </summary>
        /// <param name="tabla" type="string">
        ///   <para>
        ///     Consulta a la Base de Datos
        ///   </para>
        /// </param>
        /// <param name="arrColumnas" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los valores de las columnas en la consulta [SQL]
        ///   </para>
        /// </param>
        /// <returns>
        ///   DataTable con el resultado de la ejecución del Query
        /// </returns>
        internal DbDataReader CargarDataReader(string tabla, ArrayList arrColumnas)
        {
            var arrColWhere = new ArrayList();
            arrColWhere.Add("1");

            return CargarDataReaderAnd(tabla, arrColumnas, arrColWhere, arrColWhere, "");
        }

        /// <summary>
        ///   Función que devuelve un DataTable a partir de la ejecución de una consulta [SQL]
        /// </summary>
        /// <param name="tabla" type="string">
        ///   <para>
        ///     Nombre de la Tabla
        ///   </para>
        /// </param>
        /// <param name="arrColumnas" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los valores de las columnas en la consulta [SQL]
        ///   </para>
        /// </param>
        /// <param name="trans" type="Conexion.cTrans">
        ///   <para>
        ///     Objeto que contiene la Transaccion activa utilizada para realizar la operacion
        ///   </para>
        /// </param>
        /// <returns>
        ///   DataTable con el resultado de la ejecución del Query
        /// </returns>
        internal DbDataReader CargarDataReader(string tabla, ArrayList arrColumnas, ref CTrans trans)
        {
            var arrColWhere = new ArrayList {"1"};
            return CargarDataReaderAnd(tabla, arrColumnas, arrColWhere, arrColWhere, "", ref trans);
        }

        /// <summary>
        ///   Función que devuelve un DataTable a partir de la ejecución de una consulta [SQL]
        /// </summary>
        /// <param name="tabla" type="string">
        ///   <para>
        ///     Nombre de la Tabla
        ///   </para>
        /// </param>
        /// <param name="arrColumnas" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los valores de las columnas en la consulta [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrColumnasWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrValoresWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a los valores de las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <returns>
        ///   DataTable con el resultado de la ejecución del Query
        /// </returns>
        internal DbDataReader CargarDataReaderAnd(string tabla, ArrayList arrColumnas, ArrayList arrColumnasWhere,
                                            ArrayList arrValoresWhere)
        {
            return CargarDataReaderAnd(tabla, arrColumnas, arrColumnasWhere, arrValoresWhere, "");            
        }

		/// <summary>
        /// Funcion que devuelve un DataTable a partir del nombre de una tabla y las columnas
        /// </summary>
        /// <param name="tabla">Nombre de la tabla</param>
        /// <param name="arrColumnas">Coleccion de objetos referidad a los valores de las columnas en la consulta [SQL]</param>
        /// <returns>DataTabl con las columnas especificadas</returns>
        internal DbDataReader CargarDataReaderAnd(string tabla, ArrayList arrColumnas)
        {
            var arrColWhere = new ArrayList {"1"};
            return CargarDataReaderAnd(tabla, arrColumnas, arrColWhere, arrColWhere, "");
        }

        /// <summary>
        ///   Función que devuelve un DataTable a partir de la ejecución de una consulta [SQL]
        /// </summary>
        /// <param name="tabla" type="string">
        ///   <para>
        ///     Nombre de la Tabla
        ///   </para>
        /// </param>
        /// <param name="arrColumnas" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los valores de las columnas en la consulta [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrColumnasWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrValoresWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a los valores de las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="trans" type="Conexion.cTrans">
        ///   <para>
        ///     Objeto que contiene la Transaccion activa utilizada para realizar la operacion
        ///   </para>
        /// </param>
        /// <returns>
        ///   DataTable con el resultado de la ejecución del Query
        /// </returns>
        internal DbDataReader CargarDataReaderAnd(string tabla, ArrayList arrColumnas, ArrayList arrColumnasWhere,
                                            ArrayList arrValoresWhere, ref CTrans trans)
        {
            return CargarDataReaderAnd(tabla, arrColumnas, arrColumnasWhere, arrValoresWhere, "", ref trans);            
        }

        /// <summary>
        ///   Función que devuelve un DataTable a partir de la ejecución de una consulta [SQL]
        /// </summary>
        /// <param name="tabla" type="string">
        ///   <para>
        ///     Nombre de la Tabla
        ///   </para>
        /// </param>
        /// <param name="arrColumnas" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los valores de las columnas en la consulta [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrColumnasWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrValoresWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a los valores de las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="sParametrosAdicionales" type="string">
        ///   <para>
        ///     Parametros adicionales de la Consulta
        ///   </para>
        /// </param>
        /// <returns>
        ///   DataTable con el resultado de la ejecución del Query
        /// </returns>
        internal DbDataReader CargarDataReaderAnd(string tabla, ArrayList arrColumnas, ArrayList arrColumnasWhere,
                                            ArrayList arrValoresWhere, string sParametrosAdicionales)
        {
            var query = new StringBuilder();
            query.AppendLine("SELECT ");
            var primerReg = true;
            foreach (string columna in arrColumnas)
            {
                if (primerReg)
                {
                    query.AppendLine(columna);
                    primerReg = false;
                }
                else
                {
                    query.AppendLine(", " + columna);
                }
            }
            query.AppendLine(" FROM " + tabla + " WHERE ");

            var boolBandera = false;
            for (var intContador = 0; intContador < arrValoresWhere.Count; intContador++)
            {
                if (boolBandera)
                {
                    query.AppendLine(" AND " + arrColumnasWhere[intContador] + " = " + arrValoresWhere[intContador]);
                }
                else
                {
                    query.AppendLine(arrColumnasWhere[intContador] + " = " + arrValoresWhere[intContador]);
                    boolBandera = true;
                }
            }
            query.AppendLine(sParametrosAdicionales);

            try
            {
                return CargarDataReader(query.ToString());
            }
            catch (Exception ex)
            {
                ex.Data.Add("Query en cargarDataTableAnd", query);
                throw;
            }
        }

        /// <summary>
        ///   Función que devuelve un DataTable a partir de la ejecución de una consulta [SQL]
        /// </summary>
        /// <param name="tabla" type="string">
        ///   <para>
        ///     Nombre de la Tabla
        ///   </para>
        /// </param>
        /// <param name="arrColumnas" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los valores de las columnas en la consulta [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrColumnasWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrValoresWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a los valores de las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="sParametrosAdicionales" type="string">
        ///   <para>
        ///     Parametros Adicionales
        ///   </para>
        /// </param>
        /// <param name="trans" type="Conexion.cTrans">
        ///   <para>
        ///     Objeto que contiene la Transaccion activa utilizada para realizar la operacion
        ///   </para>
        /// </param>
        /// <returns>
        ///   DataTable con el resultado de la ejecución del Query
        /// </returns>
        internal DbDataReader CargarDataReaderAnd(string tabla, ArrayList arrColumnas, ArrayList arrColumnasWhere,
                                            ArrayList arrValoresWhere, string sParametrosAdicionales, ref CTrans trans)
        {
            var query = new StringBuilder();
            query.AppendLine("SELECT ");
            var primerReg = true;
            foreach (string columna in arrColumnas)
            {
                if (primerReg)
                {
                    query.AppendLine(columna);
                    primerReg = false;
                }
                else
                {
                    query.AppendLine(", " + columna);
                }
            }
            query.AppendLine(" FROM " + tabla + " WHERE ");

            var boolBandera = false;
            for (var intContador = 0; intContador < arrValoresWhere.Count; intContador++)
            {
                if (boolBandera)
                {
                    query.AppendLine(" AND " + arrColumnasWhere[intContador] + " = " + arrValoresWhere[intContador]);
                }
                else
                {
                    query.AppendLine(arrColumnasWhere[intContador] + " = " + arrValoresWhere[intContador]);
                    boolBandera = true;
                }
            }
            query.AppendLine(sParametrosAdicionales);

            try
            {
                return CargarDataReader(query.ToString(), ref trans);
            }
            catch (Exception ex)
            {
                ex.Data.Add("Query en cargarDataTableAnd", query);
                throw;
            }
        }
        
		/// <summary>
        ///   Función que devuelve un DataTable a partir de la ejecución de una consulta [SQL] con encadenadores LIKE
        /// </summary>
        /// <param name="tabla" type="string">
        ///   <para>
        ///     Nombre de la Tabla
        ///   </para>
        /// </param>
        /// <param name="arrColumnas" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los valores de las columnas en la consulta [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrColumnasWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrValoresWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a los valores de las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="strParamAdicionales" type="string">
        ///   <para>
        ///     Parametros Adicionales
        ///   </para>
        /// </param>        
        /// <returns>
        ///   DataTable con el resultado de la ejecución del Query
        /// </returns>
        internal DbDataReader CargarDataReaderLike(string tabla, ArrayList arrColumnas, ArrayList arrColumnasWhere,
                                             ArrayList arrValoresWhere, string strParamAdicionales)
		{
		    var query = new StringBuilder();
            query.Append("SELECT ");
            var primerReg = true;
            foreach (string columna in arrColumnas)
            {
                if (primerReg)
                {
                    query.AppendLine(columna);
                    primerReg = false;
                }
                else
                {
                    query.AppendLine(", " + columna);
                }
            }
            query.AppendLine(" FROM " + tabla + " WHERE ");

            var boolBandera = false;
            for (var intContador = 0; intContador < arrValoresWhere.Count; intContador++)
            {
                if (boolBandera)
                {
                    query.AppendLine(" AND " + arrColumnasWhere[intContador] + " LIKE " + arrValoresWhere[intContador]);
                }
                else
                {
                    query.AppendLine(arrColumnasWhere[intContador] + " = " + arrValoresWhere[intContador]);
                    boolBandera = true;
                }
            }
            query.AppendLine(strParamAdicionales);

            try
            {
                return CargarDataReader(query.ToString());
            }
            catch (Exception ex)
            {
                ex.Data.Add("Query en cargarDataTableAnd", query);
                throw;
            }
        }

        

        /// <summary>
        ///   Función que devuelve un DataTable a partir de la ejecución de una consulta [SQL]
        /// </summary>
        /// <param name="tabla" type="string">
        ///   <para>
        ///     Nombre de la Tabla
        ///   </para>
        /// </param>
        /// <param name="arrColumnas" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los valores de las columnas en la consulta [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrColumnasWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrValoresWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a los valores de las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <returns>
        ///   DataTable con el resultado de la ejecución del Query
        /// </returns>
        internal DbDataReader CargarDataReaderOr(string tabla, ArrayList arrColumnas, ArrayList arrColumnasWhere,
                                           ArrayList arrValoresWhere)
        {
            return CargarDataReaderOr(tabla, arrColumnas, arrColumnasWhere, arrValoresWhere, "");            
        }

        /// <summary>
        ///   Función que devuelve un DataTable a partir de la ejecución de una consulta [SQL]
        /// </summary>
        /// <param name="tabla" type="string">
        ///   <para>
        ///     Nombre de la Tabla
        ///   </para>
        /// </param>
        /// <param name="arrColumnas" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los valores de las columnas en la consulta [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrColumnasWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrValoresWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a los valores de las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="trans" type="Conexion.cTrans">
        ///   <para>
        ///     Objeto que contiene la Transaccion activa utilizada para realizar la operacion
        ///   </para>
        /// </param>
        /// <returns>
        ///   DataTable con el resultado de la ejecución del Query
        /// </returns>
        internal DbDataReader CargarDataReaderOr(string tabla, ArrayList arrColumnas, ArrayList arrColumnasWhere,
                                           ArrayList arrValoresWhere, ref CTrans trans)
        {
            return CargarDataReaderOr(tabla, arrColumnas, arrColumnasWhere, arrValoresWhere, "", ref trans);            
        }

        /// <summary>
        ///   Función que devuelve un DataTable a partir de la ejecución de una consulta [SQL]
        /// </summary>
        /// <param name="tabla" type="string">
        ///   <para>
        ///     Nombre de la Tabla
        ///   </para>
        /// </param>
        /// <param name="arrColumnas" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los valores de las columnas en la consulta [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrColumnasWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrValoresWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a los valores de las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="sParametrosAdicionales" type="string">
        ///   <para>
        ///     Parametros adicionales de la Consulta
        ///   </para>
        /// </param>
        /// <returns>
        ///   DataTable con el resultado de la ejecución del Query
        /// </returns>
        internal DbDataReader CargarDataReaderOr(string tabla, ArrayList arrColumnas, ArrayList arrColumnasWhere,
                                           ArrayList arrValoresWhere, string sParametrosAdicionales)
        {
            var query = new StringBuilder();
            query.AppendLine("SELECT ");
            var primerReg = true;
            foreach (string columna in arrColumnas)
            {
                if (primerReg)
                {
                    query.AppendLine(columna);
                    primerReg = false;
                }
                else
                {
                    query.AppendLine(", " + columna);
                }
            }
            query.AppendLine(" FROM " + tabla + " WHERE ");

            var boolBandera = false;
            for (var intContador = 0; intContador < arrValoresWhere.Count; intContador++)
            {
                if (boolBandera)
                {
                    query.AppendLine(" OR " + arrColumnasWhere[intContador] + " = " + arrValoresWhere[intContador]);
                }
                else
                {
                    query.AppendLine(arrColumnasWhere[intContador] + " = " + arrValoresWhere[intContador]);
                    boolBandera = true;
                }
            }
            query.AppendLine(sParametrosAdicionales);

            try
            {
                return CargarDataReader(query.ToString());
            }
            catch (Exception ex)
            {
                ex.Data.Add("Query en cargarDataTableOr", query);
                throw;
            }
        }

        /// <summary>
        ///   Función que devuelve un DataTable a partir de la ejecución de una consulta [SQL]
        /// </summary>
        /// <param name="tabla" type="string">
        ///   <para>
        ///     Nombre de la Tabla
        ///   </para>
        /// </param>
        /// <param name="arrColumnas" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los valores de las columnas en la consulta [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrColumnasWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrValoresWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a los valores de las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="sParametrosAdicionales" type="string">
        ///   <para>
        ///     Parametros Adicionales
        ///   </para>
        /// </param>
        /// <param name="trans" type="Conexion.cTrans">
        ///   <para>
        ///     Objeto que contiene la Transaccion activa utilizada para realizar la operacion
        ///   </para>
        /// </param>
        /// <returns>
        ///   DataTable con el resultado de la ejecución del Query
        /// </returns>
        internal DbDataReader CargarDataReaderOr(string tabla, ArrayList arrColumnas, ArrayList arrColumnasWhere,
                                           ArrayList arrValoresWhere, string sParametrosAdicionales, ref CTrans trans)
        {
            var query = new StringBuilder();
            query.AppendLine("SELECT ");
            var primerReg = true;
            foreach (string columna in arrColumnas)
            {
                if (primerReg)
                {
                    query.AppendLine(columna);
                    primerReg = false;
                }
                else
                {
                    query.AppendLine(", " + columna);
                }
            }
            query.AppendLine(" FROM " + tabla + " WHERE ");

            var boolBandera = false;
            for (var intContador = 0; intContador < arrValoresWhere.Count; intContador++)
            {
                if (boolBandera)
                {
                    query.AppendLine(" OR " + arrColumnasWhere[intContador] + " = " + arrValoresWhere[intContador]);
                }
                else
                {
                    query.AppendLine(arrColumnasWhere[intContador] + " = " + arrValoresWhere[intContador]);
                    boolBandera = true;
                }
            }
            query.AppendLine(sParametrosAdicionales);

            try
            {
                return CargarDataReader(query.ToString(), ref trans);
            }
            catch (Exception ex)
            {
                ex.Data.Add("Query en cargarDataTableOr", query);
                throw;
            }
        }

        #endregion

        #region Funcion: Ejecutar

        /// <summary>
        ///   Metodo que realiza el borrado de registros en una tabla de una Base de Datos
        /// </summary>
        /// <param name="nomTabla" type="string">
        ///   <para>
        ///     Nombre de la Tabla a realizar el delete
        ///   </para>
        /// </param>
        /// <param name="arrColumnasWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrValoresWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los valores de las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <returns>
        ///   El numero de filas afectadas al realizar la consulta
        /// </returns>
        public int DeleteBd(string nomTabla, ArrayList arrColumnasWhere, ArrayList arrValoresWhere)
        {
            return DeleteBd(nomTabla, arrColumnasWhere, arrValoresWhere, "");

        }

        /// <summary>
        ///   Metodo que realiza el borrado de registros en una tabla de una Base de Datos
        /// </summary>
        /// <param name="nomTabla" type="string">
        ///   <para>
        ///     Nombre de la Tabla a realizar el delete
        ///   </para>
        /// </param>
        /// <param name="arrColumnasWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a las columnas where [SQL] 
        ///   </para>
        /// </param>
        /// <param name="arrValoresWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los valores de las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="trans" type="cTrans">
        ///   <para>
        ///     Objeto que contiene la Transaccion activa utilizada para realizar la operacion
        ///   </para>
        /// </param>
        /// <returns>
        ///   Cantidad de registros afectados
        /// </returns>
        public int DeleteBd(string nomTabla, ArrayList arrColumnasWhere, ArrayList arrValoresWhere, ref CTrans trans)
        {
            return DeleteBd(nomTabla, arrColumnasWhere, arrValoresWhere, "", ref trans);
        }

        /// <summary>
        ///   Metodo que realiza el borrado de registros en una tabla de una Base de Datos
        /// </summary>
        /// <param name="nomTabla" type="string">
        ///   <para>
        ///     Nombre de la Tabla a realizar el delete
        ///   </para>
        /// </param>
        /// <param name="arrColumnasWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a las columnas where [SQL] 
        ///   </para>
        /// </param>
        /// <param name="arrValoresWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los valores de las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="strParametrosAdicionales" type="string">
        ///   <para>
        ///     Parametros adicionales
        ///   </para>
        /// </param>
        /// <returns>
        ///   Cantidad de registros afectados
        /// </returns>
        public int DeleteBd(string nomTabla, ArrayList arrColumnasWhere, ArrayList arrValoresWhere,
                            string strParametrosAdicionales)
        {
            var query = new StringBuilder();
            try
            {
                query.AppendLine("DELETE FROM " + nomTabla + " WHERE ");
                var boolBandera = false;
                for (var intContador = 0; intContador < arrValoresWhere.Count; intContador++)
                {
                    if (boolBandera)
                    {
                        query.AppendLine(" AND " + arrColumnasWhere[intContador] + " = " + arrValoresWhere[intContador]);
                    }
                    else
                    {
                        query.AppendLine(arrColumnasWhere[intContador] + " = " + arrValoresWhere[intContador]);
                        boolBandera = true;
                    }
                }
                query.AppendLine(strParametrosAdicionales);
                return Ejecutar(query.ToString());
            }
            catch (Exception ex)
            {
                ex.Data.Add("Query en deleteBD", query);
                throw;
            }
        }

        /// <summary>
        ///   Metodo que realiza el borrado de registros en una tabla de una Base de Datos
        /// </summary>
        /// <param name="nomTabla" type="string">
        ///   <para>
        ///     Nombre de la Tabla a realizar el delete
        ///   </para>
        /// </param>
        /// <param name="arrColumnasWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a las columnas where [SQL] 
        ///   </para>
        /// </param>
        /// <param name="arrValoresWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a los valores de las columnas where [SQL] 
        ///   </para>
        /// </param>
        /// <param name="strParametrosAdicionales" type="string">
        ///   <para>
        ///     Parametros adicionales
        ///   </para>
        /// </param>
        /// <param name="trans" type="Conexion.cTrans">
        ///   <para>
        ///     Objeto que contiene la Transaccion activa utilizada para realizar la operacion
        ///   </para>
        /// </param>
        /// <returns>
        ///   Cantidad de registros afectados
        /// </returns>
        public int DeleteBd(string nomTabla, ArrayList arrColumnasWhere, ArrayList arrValoresWhere,
                            string strParametrosAdicionales, ref CTrans trans)
        {
            var query = new StringBuilder();
            try
            {
                query.AppendLine("DELETE FROM " + nomTabla + " WHERE ");
                var boolBandera = false;
                for (var intContador = 0; intContador < arrValoresWhere.Count; intContador++)
                {
                    if (boolBandera)
                    {
                        query.AppendLine(" and " + arrColumnasWhere[intContador] + " = " + arrValoresWhere[intContador]);
                    }
                    else
                    {
                        query.AppendLine(arrColumnasWhere[intContador] + " = " + arrValoresWhere[intContador]);
                        boolBandera = true;
                    }
                }

                query.AppendLine(strParametrosAdicionales);

                return Ejecutar(query.ToString(), ref trans);
            }
            catch (Exception ex)
            {
                ex.Data.Add("Query en deleteBD", query);
                throw;
            }
        }

        #endregion

        #region Funcion Ejecutar con Imagenes

        /// <summary>
        ///   Metodo que realiza la inserción de un registro en una tabla de una Base de Datos
        /// </summary>
        /// <param name="tabla" type="string">
        ///   <para>
        ///     Nombre de la Tabla donde va a realizarse la inserción
        ///   </para>
        /// </param>
        /// <param name="arrColumnas" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrValores" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los valores de las columnas where [SQL]
        ///   </para>
        /// </param>
        /// <returns>
        ///   A bool value...
        /// </returns>
        public bool InsertBd(string tabla, ArrayList arrColumnas, ArrayList arrValores)
        {
            //Para soporte de imagenes---------------------------
            var encoding = new ASCIIEncoding();
            var arrParam = encoding.GetBytes("images");
            var arrPosicionByte = new ArrayList();
            //---------------------------------------------------

            var query = new StringBuilder();
            try
            {
                query.AppendLine("INSERT INTO " + tabla + "(");
                var primerReg = true;

                query.AppendLine(string.Join(",", arrColumnas.OfType<string>()));                
                query.AppendLine(") VALUES (");
                
                for (var intContador = 0; intContador < arrValores.Count; intContador++)
                {
                    if (arrValores[intContador] == null)
                    {
                        throw new ArgumentException("El elemento " + intContador + " de arrValores es NULO");
                    }

                    string strValorSet;
                    if (arrValores[intContador].GetType() == arrParam.GetType())
                    {
                        strValorSet = "?";
                        arrPosicionByte.Add(intContador);
                    }
                    else
                    {
                        strValorSet = arrValores[intContador].ToString();
                    }

                    if (primerReg)
                    {
                        query.AppendLine(strValorSet);
                        primerReg = false;
                    }
                    else
                    {
                        query.AppendLine(" , " + strValorSet);
                    }
                }

                query.AppendLine(")");


                if (ConexionBd.State == ConnectionState.Closed)
                {
                    ConexionBd.Open();
                }

                var command = new NpgsqlCommand(query.ToString(), ConexionBd);

                //Para soporte de imagenes---------------------------
                foreach (int posicion in arrPosicionByte)
                {
                    command.Parameters.Add(new NpgsqlParameter("@parametro" + posicion, NpgsqlDbType.Bytea));
                    command.Parameters["@parametro" + posicion].Value = (byte[])arrValores[posicion];
                }
                //---------------------------------------------------

                var numReg = command.ExecuteNonQuery();
                command.Dispose();
                ConexionBd.Close();
                return (numReg > 0);
            }
            catch (Exception ex)
            {
                ex.Data.Add("Query en insertBD", query);
                throw;
            }
        }

        /// <summary>
        ///   Metodo que realiza la inserción de un registro en una tabla de una Base de Datos
        /// </summary>
        /// <param name="tabla" type="string">
        ///   <para>
        ///     Nombre de la Tabla donde va a realizarse la inserción
        ///   </para>
        /// </param>
        /// <param name="arrColumnas" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a las columnas en la consulta [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrValores" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los valores de las columnas en la consulta [SQL]
        ///   </para>
        /// </param>
        /// /// <param name="intIdentity" type="System.Int32">
        ///   <para>
        ///     Valor regresado al momento de insertar la identidad
        ///   </para>
        /// </param>
        /// <returns>
        ///   Exito de la operacion
        /// </returns>
        public bool InsertBd(string tabla, ArrayList arrColumnas, ArrayList arrValores, ref int intIdentity)
        {

            //Para soporte de imagenes---------------------------
            var encoding = new ASCIIEncoding();
            var arrParam = encoding.GetBytes("images");
            var arrPosicionByte = new ArrayList();
            //---------------------------------------------------

            var query = new StringBuilder();
            try
            {
                query.AppendLine("INSERT INTO " + tabla + "(");
                query.AppendLine(string.Join(",", arrColumnas.OfType<string>()));                
                query.AppendLine(") VALUES (");

                var primerReg = true;
                for (var intContador = 0; intContador < arrValores.Count; intContador++)
                {
                    if (arrValores[intContador] == null)
                    {
                        throw new ArgumentException("El elemento " + intContador + " de arrValores es NULO");
                    }

                    string strValorSet;
                    if (arrValores[intContador].GetType() == arrParam.GetType())
                    {
                        strValorSet = "?";
                        arrPosicionByte.Add(intContador);
                    }
                    else
                    {
                        strValorSet = arrValores[intContador].ToString();
                    }

                    if (primerReg)
                    {
                        query.AppendLine(strValorSet);
                        primerReg = false;
                    }
                    else
                    {
                        query.AppendLine(" , " + strValorSet);
                    }
                }

                query.AppendLine("); SELECT ? = @@IDENTITY");

                var command = new NpgsqlCommand(query.ToString(), ConexionBd);
                //Para soporte de imagenes---------------------------
                foreach (int posicion in arrPosicionByte)
                {
                    command.Parameters.Add(new NpgsqlParameter("@parametro" + posicion, NpgsqlDbType.Bytea));
                    command.Parameters["@parametro" + posicion].Value = arrValores[posicion];
                }
                //---------------------------------------------------

                var parIdentity = command.Parameters.Add("identity", NpgsqlDbType.Integer, 0, "key");
                parIdentity.Direction = ParameterDirection.Output;

                var numReg = command.ExecuteNonQuery();
                intIdentity = int.Parse(command.Parameters[command.Parameters.Count - 1].Value.ToString());
                command.Dispose();
                ConexionBd.Close();
                return (numReg > 0);
            }
            catch (Exception ex)
            {
                ex.Data.Add("Query en insertBD", query);
                throw;
            }
        }

        /// <summary>
        ///   Metodo que realiza la inserción de un registro en una tabla de una Base de Datos
        /// </summary>
        /// <param name="tabla" type="string">
        ///   <para>
        ///     Nombre de la Tabla donde va a realizarse la inserción
        ///   </para>
        /// </param>
        /// <param name="arrColumnas" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a las columnas en la consulta [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrValores" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los valores de las columnas en la consulta [SQL]
        ///   </para>
        /// </param>
        /// <param name="trans" type="Conexion.cTrans">
        ///   <para>
        ///     Objeto que contiene la Transaccion activa utilizada para realizar la operacion
        ///   </para>
        /// </param>
        /// <returns>
        ///   Exito de la operación
        /// </returns>
        public bool InsertBd(string tabla, ArrayList arrColumnas, ArrayList arrValores, ref CTrans trans)
        {
            //Para soporte de imagenes---------------------------
            var encoding = new ASCIIEncoding();
            var arrParam = encoding.GetBytes("images");
            var arrPosicionByte = new ArrayList();
            //---------------------------------------------------

            var query = new StringBuilder();
            try
            {
                query.AppendLine("INSERT INTO " + tabla + "(");
                query.AppendLine(string.Join(",", arrColumnas.OfType<string>()));                
                query.AppendLine(") VALUES (");

                var primerReg = true;
                for (var intContador = 0; intContador < arrValores.Count; intContador++)
                {
                    if (arrValores[intContador] == null)
                    {
                        throw new ArgumentException("El elemento " + intContador + " de arrValores es NULO");
                    }

                    string strValorSet;
                    if (arrValores[intContador].GetType() == arrParam.GetType())
                    {
                        strValorSet = "?";
                        arrPosicionByte.Add(intContador);
                    }
                    else
                    {
                        strValorSet = arrValores[intContador].ToString();
                    }

                    if (primerReg)
                    {
                        query.AppendLine(strValorSet);
                        primerReg = false;
                    }
                    else
                    {
                        query.AppendLine(" , " + strValorSet);
                    }
                }

                query.AppendLine( ")");

                var command = new NpgsqlCommand(query.ToString(), trans.MyConn);
                //Para soporte de imagenes---------------------------
                foreach (int posicion in arrPosicionByte)
                {
                    command.Parameters.Add(new NpgsqlParameter("@parametro" + posicion, NpgsqlDbType.Bytea));
                    command.Parameters["@parametro" + posicion].Value = (byte[])arrValores[posicion];
                }
                //---------------------------------------------------

                command.Transaction = trans.MyTrans;
                var numReg = command.ExecuteNonQuery();
                command.Dispose();
                ConexionBd.Close();
                return (numReg > 0);
            }
            catch (Exception ex)
            {
                ex.Data.Add("Query en insertBD", query);
                throw;
            }
        }

        /// <summary>
        ///   Metodo que realiza la inserción de un registro en una tabla de una Base de Datos
        /// </summary>
        /// <param name="tabla" type="string">
        ///   <para>
        ///     Nombre de la Tabla donde va a realizarse la inserción
        ///   </para>
        /// </param>
        /// <param name="arrColumnas" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a las columnas en la consulta [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrValores" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los valores de las columnas en la consulta [SQL]
        ///   </para>
        /// </param>
        /// /// <param name="intIdentity" type="System.Int32">
        ///   <para>
        ///     Valor regresado al momento de insertar la identidad
        ///   </para>
        /// </param>
        /// <param name="trans" type="Conexion.cTrans">
        ///   <para>
        ///     Objeto que contiene la Transaccion activa utilizada para realizar la operacion
        ///   </para>
        /// </param>
        /// <returns>
        ///   A bool value...
        /// </returns>
        public bool InsertBd(string tabla, ArrayList arrColumnas, ArrayList arrValores, ref int intIdentity,
                             ref CTrans trans)
        {

            //Para soporte de imagenes---------------------------
            var encoding = new ASCIIEncoding();
            var arrParam = encoding.GetBytes("images");
            var arrPosicionByte = new ArrayList();
            //---------------------------------------------------

            var query = new StringBuilder();
            try
            {
                query.AppendLine("INSERT INTO " + tabla + "(");
                query.AppendLine(string.Join(",", arrColumnas.OfType<string>()));                

                query.AppendLine(") VALUES (");

                var primerReg = true;
                for (var intContador = 0; intContador < arrValores.Count; intContador++)
                {
                    if (arrValores[intContador] == null)
                    {
                        throw new ArgumentException("El elemento " + intContador + " de arrValores es NULO");
                    }

                    string strValorSet;
                    if (arrValores[intContador].GetType() == arrParam.GetType())
                    {
                        strValorSet = "?";
                        arrPosicionByte.Add(intContador);
                    }
                    else
                    {
                        strValorSet = arrValores[intContador].ToString();
                    }

                    if (primerReg)
                    {
                        query.AppendLine(strValorSet);
                        primerReg = false;
                    }
                    else
                    {
                        query.AppendLine(" , " + strValorSet);
                    }
                }

                query.AppendLine("); SELECT ? = @@IDENTITY");

                var command = new NpgsqlCommand(query.ToString(), trans.MyConn);
                //Para soporte de imagenes---------------------------
                foreach (int posicion in arrPosicionByte)
                {
                    command.Parameters.Add(new NpgsqlParameter("@parametro" + posicion, NpgsqlDbType.Bytea));
                    command.Parameters["@parametro" + posicion].Value = arrValores[posicion];
                }
                //---------------------------------------------------

                var parIdentity = command.Parameters.Add("identity", NpgsqlDbType.Integer, 0, "key");
                parIdentity.Direction = ParameterDirection.Output;

                command.Transaction = trans.MyTrans;
                var numReg = command.ExecuteNonQuery();
                intIdentity = int.Parse(command.Parameters[command.Parameters.Count - 1].Value.ToString());
                command.Dispose();
                ConexionBd.Close();
                return (numReg > 0);
            }
            catch (Exception ex)
            {
                ex.Data.Add("Query en insertBD", query);
                throw;
            }
        }

        /// <summary>
        ///   Metodo que realiza la actualizacion de un registro en una tabla de una Base de Datos
        /// </summary>
        /// <param name="nomTabla" type="string">
        ///   <para>
        ///     Nombre de la Tabla
        ///   </para>
        /// </param>
        /// <param name="arrColumnasSet" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a las columnas del SET [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrValoresSet" type="System.Collections.ArrayList">
        ///   <para>
        ///    Coleccion de objetos referidas a los valores de las columnas del SET [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrColumnasWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a las columnas del WHERE [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrValoresWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a los valores de las columnas del WHERE [SQL]
        ///   </para>
        /// </param>
        /// <returns>
        ///   Número de registros afectados por la ejecución del query
        /// </returns>
        public int UpdateBd(string nomTabla, ArrayList arrColumnasSet, ArrayList arrValoresSet,
                            ArrayList arrColumnasWhere, ArrayList arrValoresWhere)
        {
            //Para soporte de imagenes---------------------------
            var encoding = new ASCIIEncoding();
            var arrParam = encoding.GetBytes("images");
            var arrPosicionByte = new ArrayList();
            //---------------------------------------------------

            var query= new StringBuilder();
            query.AppendLine("UPDATE " + nomTabla + " SET ");
            try
            {
                var boolBandera = false;

                for (var intContador = 0; intContador < arrValoresSet.Count; intContador++)
                {
                    if (arrValoresSet[intContador] == null)
                    {
                        if (boolBandera)
                        {
                            query.AppendLine(" , " + arrColumnasSet[intContador] + " = null ");
                        }
                        else
                        {
                            query.AppendLine(arrColumnasSet[intContador] + " = null ");
                            boolBandera = true;
                        }
                    }
                    else
                    {
                        string strValorSet;
                        if (arrValoresSet[intContador].GetType() == arrParam.GetType())
                        {
                            strValorSet = "?";
                            arrPosicionByte.Add(intContador);
                        }
                        else
                        {
                            strValorSet = arrValoresSet[intContador].ToString();
                        }
                        if (boolBandera)
                        {
                            query.AppendLine(" , " + arrColumnasSet[intContador] + " = " +
                                    strValorSet);
                        }
                        else
                        {
                            query.AppendLine(arrColumnasSet[intContador] + " = " + strValorSet);
                            boolBandera = true;
                        }
                    }
                }
                query.AppendLine(" WHERE ");

                boolBandera = false;
                for (var intContador = 0; intContador < arrValoresWhere.Count; intContador++)
                {
                    if (boolBandera)
                    {
                        query.AppendLine(" AND " + arrColumnasWhere[intContador] + " = " +
                                arrValoresWhere[intContador]);
                    }
                    else
                    {
                        query.AppendLine(arrColumnasWhere[intContador] + " = " +
                                arrValoresWhere[intContador]);
                        boolBandera = true;
                    }
                }

                if (ConexionBd.State == ConnectionState.Closed)
                {
                    ConexionBd.Open();
                }

                var command = new NpgsqlCommand(query.ToString(), ConexionBd);

                //Para soporte de imagenes---------------------------
                foreach (int posicion in arrPosicionByte)
                {
                    command.Parameters.Add(new NpgsqlParameter("@parametro" + posicion, NpgsqlDbType.Bytea));
                    command.Parameters["@parametro" + posicion].Value = (byte[])arrValoresSet[posicion];
                }
                //---------------------------------------------------

                var numReg = command.ExecuteNonQuery();
                command.Dispose();
                ConexionBd.Close();
                return numReg;
            }
            catch (Exception ex)
            {
                ex.Data.Add("Query en updateBD", query);
                throw;
            }
        }

        /// <summary>
        ///   Metodo que realiza la actualizacion de un registro en una tabla de una Base de Datos
        /// </summary>
        /// <param name="nomTabla" type="string">
        ///   <para>
        ///     Nombre de la tabla a realizar la actualizacion
        ///   </para>
        /// </param>
        /// <param name="arrColumnasSet" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a las columnas del SET [SQL] 
        ///   </para>
        /// </param>
        /// <param name="arrValoresSet" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a los valores de las columnas del SET [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrColumnasWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a las columnas del WHERE [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrValoresWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a los valores de las columnas del WHERE [SQL]
        ///   </para>
        /// </param>
        /// <param name="trans" type="cTrans">
        ///   <para>
        ///     Transaccion activa utilizada para realizar la operacion
        ///   </para>
        /// </param>
        /// <returns>
        ///   Cantidad de registros afectados por la consulta
        /// </returns>
        public int UpdateBd(string nomTabla, ArrayList arrColumnasSet, ArrayList arrValoresSet,
                            ArrayList arrColumnasWhere, ArrayList arrValoresWhere, ref CTrans trans)
        {
            //Para soporte de imagenes---------------------------
            var encoding = new ASCIIEncoding();
            var arrParam = encoding.GetBytes("images");
            var arrPosicionByte = new ArrayList();
            //---------------------------------------------------

            var query = new StringBuilder();
            try
            {
                query.AppendLine("UPDATE " + nomTabla + " SET ");
                var boolBandera = false;
                for (var intContador = 0; intContador < arrValoresSet.Count; intContador++)
                {
                    if (arrValoresSet[intContador] == null)
                    {
                        if (boolBandera)
                        {
                            query.AppendLine(" , " + arrColumnasSet[intContador] + " = null ");
                        }
                        else
                        {
                            query.AppendLine(arrColumnasSet[intContador] + " = null ");
                            boolBandera = true;
                        }
                    }
                    else
                    {
                        string strValorSet;
                        if (arrValoresSet[intContador].GetType() == arrParam.GetType())
                        {
                            strValorSet = "?";
                            arrPosicionByte.Add(intContador);
                        }
                        else
                        {
                            strValorSet = arrValoresSet[intContador].ToString();
                        }
                        if (boolBandera)
                        {
                            query.AppendLine(" , " + arrColumnasSet[intContador] + " = " + strValorSet);
                        }
                        else
                        {
                            query.AppendLine(arrColumnasSet[intContador] + " = " + strValorSet);
                            boolBandera = true;
                        }
                    }
                }
                query.AppendLine(" WHERE ");

                boolBandera = false;
                for (var intContador = 0; intContador < arrValoresWhere.Count; intContador++)
                {
                    if (boolBandera)
                    {
                        query.AppendLine(" AND " + arrColumnasWhere[intContador] + " = " + arrValoresWhere[intContador]);
                    }
                    else
                    {
                        query.AppendLine(arrColumnasWhere[intContador] + " = " + arrValoresWhere[intContador] + "");
                        boolBandera = true;
                    }
                }

                var command = new NpgsqlCommand(query.ToString(), trans.MyConn);

                //Para soporte de imagenes---------------------------
                foreach (int posicion in arrPosicionByte)
                {
                    command.Parameters.Add(new NpgsqlParameter("@parametro" + posicion, NpgsqlDbType.Bytea));
                    command.Parameters["@parametro" + posicion].Value = (byte[])arrValoresSet[posicion];
                }
                //---------------------------------------------------

                command.Transaction = trans.MyTrans;
                var numReg = command.ExecuteNonQuery();
                command.Dispose();
                ConexionBd.Close();
                return numReg;
            }
            catch (Exception ex)
            {
                ex.Data.Add("Query en updateBD", query);
                throw;
            }
        }

        /// <summary>
        ///   Metodo que realiza la actualizacion de un registro en una tabla de una Base de Datos
        /// </summary>
        /// <param name="nomTabla" type="string">
        ///   <para>
        ///     Nombre de la Tabla
        ///   </para>
        /// </param>
        /// <param name="arrColumnasSet" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a las columnas del SET [SQL] 
        ///   </para>
        /// </param>
        /// <param name="arrValoresSet" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a los valores de las columnas del SET [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrColumnasWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a las columnas del WHERE [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrValoresWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a los valores de las columnas del WHERE [SQL]
        ///   </para>
        /// </param>
        /// <param name="strParametrosAdicionales" type="string">
        ///   <para>
        ///     Parametros adicionales
        ///   </para>
        /// </param>
        /// <returns>
        ///   A int value...
        /// </returns>
        public int UpdateBd(string nomTabla, ArrayList arrColumnasSet, ArrayList arrValoresSet,
                            ArrayList arrColumnasWhere, ArrayList arrValoresWhere, string strParametrosAdicionales)
        {
            //Para soporte de imagenes---------------------------
            var encoding = new ASCIIEncoding();
            var arrParam = encoding.GetBytes("images");
            var arrPosicionByte = new ArrayList();
            //---------------------------------------------------

            var query = new StringBuilder();
            try
            {
                query.AppendLine("UPDATE " + nomTabla + " SET ");
                var boolBandera = false;
                for (var intContador = 0; intContador < arrValoresSet.Count; intContador++)
                {
                    if (arrValoresSet[intContador] == null)
                    {
                        if (boolBandera)
                        {
                            query.AppendLine(" , " + arrColumnasSet[intContador] + " = null ");
                        }
                        else
                        {
                            query.AppendLine(arrColumnasSet[intContador] + " = null ");
                            boolBandera = true;
                        }
                    }
                    else
                    {
                        string strValorSet;
                        if (arrValoresSet[intContador].GetType() == arrParam.GetType())
                        {
                            strValorSet = "?";
                            arrPosicionByte.Add(intContador);
                        }
                        else
                        {
                            strValorSet = arrValoresSet[intContador].ToString();
                        }
                        if (boolBandera)
                        {
                            query.AppendLine(" , " + arrColumnasSet[intContador] + " = " + strValorSet);
                        }
                        else
                        {
                            query.AppendLine(arrColumnasSet[intContador] + " = " + strValorSet);
                            boolBandera = true;
                        }
                    }

                }
                query.AppendLine(" WHERE ");

                boolBandera = false;
                for (var intContador = 0; intContador < arrValoresWhere.Count; intContador++)
                {
                    if (boolBandera)
                    {
                        query.AppendLine(" AND " + arrColumnasWhere[intContador] + " = " + arrValoresWhere[intContador]);
                    }
                    else
                    {
                        query.AppendLine(arrColumnasWhere[intContador] + " = " + arrValoresWhere[intContador] + "");
                        boolBandera = true;
                    }
                }

                query.AppendLine(strParametrosAdicionales);

                if (ConexionBd.State == ConnectionState.Closed)
                {
                    ConexionBd.Open();
                }

                var command = new NpgsqlCommand(query.ToString(), ConexionBd);

                //Para soporte de imagenes---------------------------
                foreach (int posicion in arrPosicionByte)
                {
                    command.Parameters.Add(new NpgsqlParameter("@parametro" + posicion, NpgsqlDbType.Bytea));
                    command.Parameters["@parametro" + posicion].Value = (byte[])arrValoresSet[posicion];
                }
                //---------------------------------------------------

                var numReg = command.ExecuteNonQuery();
                command.Dispose();
                ConexionBd.Close();
                return numReg;
            }
            catch (Exception ex)
            {
                ex.Data.Add("Query en updateBD", query);
                throw;
            }
        }

        /// <summary>
        ///   Metodo que realiza la actualizacion de un registro en una tabla de una Base de Datos
        /// </summary>
        /// <param name="nomTabla" type="string">
        ///   <para>
        ///     Nombre de la Tabla
        ///   </para>
        /// </param>
        /// <param name="arrColumnasSet" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a las columnas del SET [SQL] 
        ///   </para>
        /// </param>
        /// <param name="arrValoresSet" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a los valores de las columnas del SET [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrColumnasWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a las columnas del WHERE [SQL]
        ///   </para>
        /// </param>
        /// <param name="arrValoresWhere" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidas a los valores de las columnas del WHERE [SQL]
        ///   </para>
        /// </param>
        /// <param name="strParametrosAdicionales" type="string">
        ///   <para>
        ///     
        ///   </para>
        /// </param>
        /// <param name="trans" type="Conexion.cTrans">
        ///   <para>
        ///     Objeto que contiene la Transaccion activa utilizada para realizar la operacion
        ///   </para>
        /// </param>
        /// <returns>
        ///   A int value...
        /// </returns>
        public int UpdateBd(string nomTabla, ArrayList arrColumnasSet, ArrayList arrValoresSet,
                            ArrayList arrColumnasWhere, ArrayList arrValoresWhere, string strParametrosAdicionales,
                            ref CTrans trans)
        {
            //Para soporte de imagenes---------------------------
            var encoding = new ASCIIEncoding();
            var arrParam = encoding.GetBytes("images");
            var arrPosicionByte = new ArrayList();
            //---------------------------------------------------

            var query = new StringBuilder();
            try
            {
                query.AppendLine("UPDATE " + nomTabla + " SET ");
                var boolBandera = false;
                for (var intContador = 0; intContador < arrValoresSet.Count; intContador++)
                {
                    if (arrValoresSet[intContador] == null)
                    {
                        if (boolBandera)
                        {
                            query.AppendLine(" , " + arrColumnasSet[intContador] + " = null ");
                        }
                        else
                        {
                            query.AppendLine(arrColumnasSet[intContador] + " = null ");
                            boolBandera = true;
                        }
                    }
                    else
                    {
                        string strValorSet;
                        if (arrValoresSet[intContador].GetType() == arrParam.GetType())
                        {
                            strValorSet = "?";
                            arrPosicionByte.Add(intContador);
                        }
                        else
                        {
                            strValorSet = arrValoresSet[intContador].ToString();
                        }
                        if (boolBandera)
                        {
                            query.AppendLine(" , " + arrColumnasSet[intContador] + " = " + strValorSet);
                        }
                        else
                        {
                            query.AppendLine(arrColumnasSet[intContador] + " = " + strValorSet);
                            boolBandera = true;
                        }
                    }
                }
                query.AppendLine(" WHERE ");

                boolBandera = false;
                for (var intContador = 0; intContador < arrValoresWhere.Count; intContador++)
                {
                    if (boolBandera)
                    {
                        query.AppendLine(" AND " + arrColumnasWhere[intContador] + " = " + arrValoresWhere[intContador]);
                    }
                    else
                    {
                        query.AppendLine(arrColumnasWhere[intContador] + " = " + arrValoresWhere[intContador] + "");
                        boolBandera = true;
                    }
                }

                query.AppendLine(strParametrosAdicionales);

                var command = new NpgsqlCommand(query.ToString(), trans.MyConn);

                //Para soporte de imagenes---------------------------
                foreach (int posicion in arrPosicionByte)
                {
                    command.Parameters.Add(new NpgsqlParameter("@parametro" + posicion, NpgsqlDbType.Bytea));
                    command.Parameters["@parametro" + posicion].Value = (byte[])arrValoresSet[posicion];
                }
                //---------------------------------------------------

                command.Transaction = trans.MyTrans;
                var numReg = command.ExecuteNonQuery();
                command.Dispose();
                ConexionBd.Close();
                return numReg;
            }
            catch (Exception ex)
            {
                ex.Data.Add("Query en updateBD", query);
                throw;
            }
        }

        #endregion

        #region Funciones: SpSel to DataTable

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strNombreTabla"></param>
        /// <returns></returns>
        public DataTable ExecStoreProcedureSel(string strNombreTabla)
        {
            DataTable dtTemp;

            try
            {
                dtTemp = ExecStoreProcedureToDataTable("Sp" + strNombreTabla + "Sel");
            }
            catch (Exception ex)
            {
                ex.Data.Add("execStoreProcedureSel", strNombreTabla);
                throw;
            }

            return dtTemp;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strNombreTabla"></param>
        /// <param name="myTrans"></param>
        /// <returns></returns>
        public DataTable ExecStoreProcedureSel(string strNombreTabla, ref CTrans myTrans)
        {
            DataTable dtTemp;

            try
            {
                dtTemp = ExecStoreProcedureToDataTable("Sp" + strNombreTabla + "Sel", ref myTrans);
            }
            catch (Exception ex)
            {
                ex.Data.Add("execStoreProcedureSel", strNombreTabla);
                throw;
            }

            return dtTemp;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strNombreTabla"></param>
        /// <param name="arrParametrosSelect"></param>
        /// <returns></returns>
        public DataTable ExecStoreProcedureSel(string strNombreTabla, ArrayList arrParametrosSelect)
        {
            DataTable dtTemp;

            var strParametrosSelect = new StringBuilder();

            var bPrimerElemento = true;
            foreach (string strSelect in arrParametrosSelect)
            {
                if (bPrimerElemento)
                {
                    strParametrosSelect.AppendLine(strSelect);
                    bPrimerElemento = false;
                }
                else
                {
                    strParametrosSelect.AppendLine(", " + strSelect);
                }
            }

            var arrNombreParametros = new ArrayList {"Columnas"};
            var arrParametros = new ArrayList {strParametrosSelect.ToString()};

            try
            {
                dtTemp = ExecStoreProcedureToDataTable("Sp" + strNombreTabla + "SelPick", arrNombreParametros,
                                                       arrParametros);
            }
            catch (Exception ex)
            {
                ex.Data.Add("execStoreProcedureSel", strNombreTabla);
                throw;
            }

            return dtTemp;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strNombreTabla"></param>
        /// <param name="arrParametrosSelect"></param>
        /// <param name="myTrans"></param>
        /// <returns></returns>
        public DataTable ExecStoreProcedureSel(string strNombreTabla, ArrayList arrParametrosSelect, ref CTrans myTrans)
        {
            DataTable dtTemp;

            var strParametrosSelect = new StringBuilder();

            var bPrimerElemento = true;
            foreach (string strSelect in arrParametrosSelect)
            {
                if (bPrimerElemento)
                {
                    strParametrosSelect.AppendLine(strSelect);
                    bPrimerElemento = false;
                }
                else
                {
                    strParametrosSelect.AppendLine(", " + strSelect);
                }
            }

            var arrNombreParametros = new ArrayList {"Columnas"};
            var arrParametros = new ArrayList {strParametrosSelect.ToString()};

            try
            {
                dtTemp = ExecStoreProcedureToDataTable("Sp" + strNombreTabla + "SelPick", arrNombreParametros,
                                                       arrParametros, ref myTrans);
            }
            catch (Exception ex)
            {
                ex.Data.Add("execStoreProcedureSel", strNombreTabla);
                throw;
            }

            return dtTemp;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strNombreTabla"></param>
        /// <param name="arrParametrosWhere"></param>
        /// <param name="arrParametrosValores"></param>
        /// <returns></returns>
        public DataTable ExecStoreProcedureSel(string strNombreTabla, ArrayList arrParametrosWhere,
                                               ArrayList arrParametrosValores)
        {
            DataTable dtTemp;

            var strParametrosWhere = new StringBuilder();

            var bPrimerElemento = true;
            for (var i = 0; i < arrParametrosWhere.Count - 1; i++)
            {
                if (bPrimerElemento)
                {
                    strParametrosWhere.AppendLine(arrParametrosWhere[i] + " = " + arrParametrosValores[i]);
                    bPrimerElemento = false;
                }
                else
                {
                    strParametrosWhere.AppendLine(" AND " + strParametrosWhere);
                }
            }

            var arrNombreParametros = new ArrayList {"ColumnasWhere"};
            var arrParametros = new ArrayList {strParametrosWhere.ToString()};

            try
            {
                dtTemp = ExecStoreProcedureToDataTable("Sp" + strNombreTabla + "SelCnd", arrNombreParametros,
                                                       arrParametros);
            }
            catch (Exception ex)
            {
                ex.Data.Add("execStoreProcedureSel", strNombreTabla);
                throw;
            }

            return dtTemp;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strNombreTabla"></param>
        /// <param name="arrParametrosWhere"></param>
        /// <param name="arrParametrosValores"></param>
        /// <param name="myTrans"></param>
        /// <returns></returns>
        public DataTable ExecStoreProcedureSel(string strNombreTabla, ArrayList arrParametrosWhere,
                                               ArrayList arrParametrosValores, ref CTrans myTrans)
        {
            DataTable dtTemp;

            var strParametrosWhere = new StringBuilder();

            var bPrimerElemento = true;
            for (var i = 0; i < arrParametrosWhere.Count - 1; i++)
            {
                if (bPrimerElemento)
                {
                    strParametrosWhere.AppendLine(arrParametrosWhere[i] + " = " + arrParametrosValores[i]);
                    bPrimerElemento = false;
                }
                else
                {
                    strParametrosWhere.AppendLine(" AND " + strParametrosWhere);
                }
            }

            var arrNombreParametros = new ArrayList {"ColumnasWhere"};
            var arrParametros = new ArrayList {strParametrosWhere.ToString()};

            try
            {
                dtTemp = ExecStoreProcedureToDataTable("Sp" + strNombreTabla + "SelCnd", arrNombreParametros,
                                                       arrParametros, ref myTrans);
            }
            catch (Exception ex)
            {
                ex.Data.Add("execStoreProcedureSel", strNombreTabla);
                throw;
            }

            return dtTemp;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strNombreTabla"></param>
        /// <param name="arrParametrosSelect"></param>
        /// <param name="arrParametrosWhere"></param>
        /// <param name="arrParametrosValores"></param>
        /// <returns></returns>
        public DataTable ExecStoreProcedureSel(string strNombreTabla, ArrayList arrParametrosSelect,
                                               ArrayList arrParametrosWhere, ArrayList arrParametrosValores)
        {
            DataTable dtTemp;

            var strParametrosSelect = new StringBuilder();

            var bPrimerElemento = true;
            foreach (string strSelect in arrParametrosSelect)
            {
                if (bPrimerElemento)
                {
                    strParametrosSelect.AppendLine(strSelect);
                    bPrimerElemento = false;
                }
                else
                {
                    strParametrosSelect.AppendLine(strParametrosSelect + ", " + strSelect);
                }
            }

            var strParametrosWhere = new StringBuilder();
            bPrimerElemento = true;
            for (var i = 0; i < arrParametrosWhere.Count - 1; i++)
            {
                if (bPrimerElemento)
                {
                    strParametrosWhere.AppendLine(arrParametrosWhere[i] + " = " + arrParametrosValores[i]);
                    bPrimerElemento = false;
                }
                else
                {
                    strParametrosWhere.AppendLine(" AND " + strParametrosWhere);
                }
            }

            var arrNombreParametros = new ArrayList();
            arrNombreParametros.Add("Columnas");
            arrNombreParametros.Add("ColumnasWhere");
            var arrParametros = new ArrayList();
            arrParametros.Add(strParametrosSelect.ToString());
            arrParametros.Add(strParametrosWhere.ToString());

            try
            {
                dtTemp = ExecStoreProcedureToDataTable("Sp" + strNombreTabla + "SelPickCnd", arrNombreParametros,
                                                       arrParametros);
            }
            catch (Exception ex)
            {
                ex.Data.Add("execStoreProcedureSel", strNombreTabla);
                throw;
            }

            return dtTemp;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strNombreTabla"></param>
        /// <param name="arrParametrosSelect"></param>
        /// <param name="arrParametrosWhere"></param>
        /// <param name="arrParametrosValores"></param>
        /// <param name="myTrans"></param>
        /// <returns></returns>
        public DataTable ExecStoreProcedureSel(string strNombreTabla, ArrayList arrParametrosSelect,
                                               ArrayList arrParametrosWhere, ArrayList arrParametrosValores,
                                               ref CTrans myTrans)
        {
            DataTable dtTemp;

            var strParametrosSelect = new StringBuilder();

            var bPrimerElemento = true;
            foreach (string strSelect in arrParametrosSelect)
            {
                if (bPrimerElemento)
                {
                    strParametrosSelect.AppendLine(strSelect);
                    bPrimerElemento = false;
                }
                else
                {
                    strParametrosSelect.AppendLine(", " + strSelect);
                }
            }

            var strParametrosWhere = new StringBuilder();
            bPrimerElemento = true;
            for (var i = 0; i < arrParametrosWhere.Count - 1; i++)
            {
                if (bPrimerElemento)
                {
                    strParametrosWhere.AppendLine(arrParametrosWhere[i] + " = " + arrParametrosValores[i]);
                    bPrimerElemento = false;
                }
                else
                {
                    strParametrosWhere.AppendLine(" AND " + strParametrosWhere);
                }
            }

            var arrNombreParametros = new ArrayList {"Columnas", "ColumnasWhere"};
            var arrParametros = new ArrayList {strParametrosSelect.ToString(), strParametrosWhere.ToString()};

            try
            {
                dtTemp = ExecStoreProcedureToDataTable("Sp" + strNombreTabla + "SelPickCnd", arrNombreParametros,
                                                       arrParametros, ref myTrans);
            }
            catch (Exception ex)
            {
                ex.Data.Add("execStoreProcedureSel", strNombreTabla);
                throw;
            }

            return dtTemp;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strNombreTabla"></param>
        /// <param name="arrParametrosSelect"></param>
        /// <param name="arrParametrosWhere"></param>
        /// <param name="arrParametrosValores"></param>
        /// <param name="strParamAdicionales"></param>
        /// <returns></returns>
        public DataTable ExecStoreProcedureSel(string strNombreTabla, ArrayList arrParametrosSelect,
                                               ArrayList arrParametrosWhere, ArrayList arrParametrosValores,
                                               string strParamAdicionales)
        {
            DataTable dtTemp;

            var strParametrosSelect = new StringBuilder();

            var bPrimerElemento = true;
            foreach (string strSelect in arrParametrosSelect)
            {
                if (bPrimerElemento)
                {
                    strParametrosSelect.AppendLine(strSelect);
                    bPrimerElemento = false;
                }
                else
                {
                    strParametrosSelect.AppendLine(strParametrosSelect + ", " + strSelect);
                }
            }

            var strParametrosWhere = new StringBuilder();
            bPrimerElemento = true;
            for (var i = 0; i < arrParametrosWhere.Count - 1; i++)
            {
                if (bPrimerElemento)
                {
                    strParametrosWhere.AppendLine(arrParametrosWhere[i] + " = " + arrParametrosValores[i]);
                    bPrimerElemento = false;
                }
                else
                {
                    strParametrosWhere.AppendLine(" AND " + strParametrosWhere);
                }
            }


            var arrNombreParametros = new ArrayList {"Columnas", "ColumnasWhere", "Parametros"};
            var arrParametros = new ArrayList
            {
                strParametrosSelect.ToString(),
                strParametrosWhere.ToString(),
                strParamAdicionales
            };

            try
            {
                dtTemp = ExecStoreProcedureToDataTable("Sp" + strNombreTabla + "SelPickCndExt", arrNombreParametros,
                                                       arrParametros);
            }
            catch (Exception ex)
            {
                ex.Data.Add("execStoreProcedureSel", strNombreTabla);
                throw;
            }

            return dtTemp;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strNombreTabla"></param>
        /// <param name="arrParametrosSelect"></param>
        /// <param name="arrParametrosWhere"></param>
        /// <param name="arrParametrosValores"></param>
        /// <param name="strParamAdicionales"></param>
        /// <param name="myTrans"></param>
        /// <returns></returns>
        public DataTable ExecStoreProcedureSel(string strNombreTabla, ArrayList arrParametrosSelect,
                                               ArrayList arrParametrosWhere, ArrayList arrParametrosValores,
                                               string strParamAdicionales, ref CTrans myTrans)
        {
            DataTable dtTemp;

            var strParametrosSelect = new StringBuilder();

            var bPrimerElemento = true;
            foreach (string strSelect in arrParametrosSelect)
            {
                if (bPrimerElemento)
                {
                    strParametrosSelect.AppendLine(strSelect);
                    bPrimerElemento = false;
                }
                else
                {
                    strParametrosSelect.AppendLine(", " + strSelect);
                }
            }


            var strParametrosWhere = new StringBuilder();
            bPrimerElemento = true;
            for (var i = 0; i < arrParametrosWhere.Count - 1; i++)
            {
                if (bPrimerElemento)
                {
                    strParametrosWhere.AppendLine(arrParametrosWhere[i] + " = " + arrParametrosValores[i]);
                    bPrimerElemento = false;
                }
                else
                {
                    strParametrosWhere.AppendLine(" AND " + strParametrosWhere);
                }
            }


            var arrNombreParametros = new ArrayList {"Columnas", "ColumnasWhere", "Parametros"};
            var arrParametros = new ArrayList
            {
                strParametrosSelect.ToString(),
                strParametrosWhere.ToString(),
                strParamAdicionales
            };

            try
            {
                dtTemp = ExecStoreProcedureToDataTable("Sp" + strNombreTabla + "SelPickCndExt", arrNombreParametros,
                                                       arrParametros, ref myTrans);
            }
            catch (Exception ex)
            {
                ex.Data.Add("execStoreProcedureSel", strNombreTabla);
                throw;
            }

            return dtTemp;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strNombreTabla"></param>
        /// <param name="arrParametrosSelect"></param>
        /// <param name="arrParametrosWhere"></param>
        /// <param name="arrParametrosValores"></param>
        /// <returns></returns>
        public DataTable ExecStoreProcedureSelOr(string strNombreTabla, ArrayList arrParametrosSelect,
                                                 ArrayList arrParametrosWhere, ArrayList arrParametrosValores)
        {
            DataTable dtTemp;

            var strParametrosSelect = new StringBuilder();

            var bPrimerElemento = true;
            foreach (string strSelect in arrParametrosSelect)
            {
                if (bPrimerElemento)
                {
                    strParametrosSelect.AppendLine(strSelect);
                    bPrimerElemento = false;
                }
                else
                {
                    strParametrosSelect.AppendLine(", " + strSelect);
                }
            }


            var strParametrosWhere = new StringBuilder();
            bPrimerElemento = true;
            for (var i = 0; i < arrParametrosWhere.Count - 1; i++)
            {
                if (bPrimerElemento)
                {
                    strParametrosWhere.AppendLine(arrParametrosWhere[i] + " = " + arrParametrosValores[i]);
                    bPrimerElemento = false;
                }
                else
                    strParametrosWhere.AppendLine(" OR " + strParametrosWhere);
            }

            var arrNombreParametros = new ArrayList {"Columnas", "ColumnasWhere"};
            var arrParametros = new ArrayList
            {
                strParametrosSelect.ToString(), 
                strParametrosWhere.ToString()
            };

            try
            {
                dtTemp = ExecStoreProcedureToDataTable("Sp" + strNombreTabla + "SelPickCnd", arrNombreParametros,
                                                       arrParametros);
            }
            catch (Exception ex)
            {
                ex.Data.Add("execStoreProcedureSel", strNombreTabla);
                throw;
            }

            return dtTemp;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strNombreTabla"></param>
        /// <param name="arrParametrosSelect"></param>
        /// <param name="arrParametrosWhere"></param>
        /// <param name="arrParametrosValores"></param>
        /// <param name="myTrans"></param>
        /// <returns></returns>
        public DataTable ExecStoreProcedureSelOr(string strNombreTabla, ArrayList arrParametrosSelect,
                                                 ArrayList arrParametrosWhere, ArrayList arrParametrosValores,
                                                 ref CTrans myTrans)
        {
            DataTable dtTemp;

            var strParametrosSelect = new StringBuilder();

            var bPrimerElemento = true;
            foreach (string strSelect in arrParametrosSelect)
            {
                if (bPrimerElemento)
                {
                    strParametrosSelect.AppendLine(strSelect);
                    bPrimerElemento = false;
                }
                else
                {
                    strParametrosSelect.AppendLine(", " + strSelect);
                }
            }

            var strParametrosWhere = new StringBuilder();
            bPrimerElemento = true;
            for (var i = 0; i < arrParametrosWhere.Count - 1; i++)
            {
                if (bPrimerElemento)
                {
                    strParametrosWhere.AppendLine(arrParametrosWhere[i] + " = " + arrParametrosValores[i]);
                    bPrimerElemento = false;
                }
                else
                    strParametrosWhere.AppendLine(" OR " + strParametrosWhere);
            }

            var arrNombreParametros = new ArrayList {"Columnas", "ColumnasWhere"};
            var arrParametros = new ArrayList {strParametrosSelect.ToString(), strParametrosWhere.ToString()};

            try
            {
                dtTemp = ExecStoreProcedureToDataTable("Sp" + strNombreTabla + "SelPickCnd", arrNombreParametros,
                                                       arrParametros);
            }
            catch (Exception ex)
            {
                ex.Data.Add("execStoreProcedureSel", strNombreTabla);
                throw;
            }

            return dtTemp;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strNombreTabla"></param>
        /// <param name="arrParametrosSelect"></param>
        /// <param name="arrParametrosWhere"></param>
        /// <param name="arrParametrosValores"></param>
        /// <param name="strParamAdicionales"></param>
        /// <returns></returns>
        public DataTable ExecStoreProcedureSelOr(string strNombreTabla, ArrayList arrParametrosSelect,
                                                 ArrayList arrParametrosWhere, ArrayList arrParametrosValores,
                                                 string strParamAdicionales)
        {
            DataTable dtTemp;

            var strParametrosSelect = new StringBuilder();

            var bPrimerElemento = true;
            foreach (string strSelect in arrParametrosSelect)
            {
                if (bPrimerElemento)
                {
                    strParametrosSelect.AppendLine(strSelect);
                    bPrimerElemento = false;
                }
                else
                {
                    strParametrosSelect.AppendLine(", " + strSelect);
                }
            }


            var strParametrosWhere = new StringBuilder();
            bPrimerElemento = true;
            for (var i = 0; i < arrParametrosWhere.Count - 1; i++)
            {
                if (bPrimerElemento)
                {
                    strParametrosWhere.AppendLine(arrParametrosWhere[i] + " = " + arrParametrosValores[i]);
                    bPrimerElemento = false;
                }
                else
                    strParametrosWhere.AppendLine(" OR " + strParametrosWhere);
            }


            var arrNombreParametros = new ArrayList {"Columnas", "ColumnasWhere", "Parametros"};
            var arrParametros = new ArrayList
            {
                strParametrosSelect.ToString(),
                strParametrosWhere.ToString(),
                strParamAdicionales
            };

            try
            {
                dtTemp = ExecStoreProcedureToDataTable("Sp" + strNombreTabla + "SelPickCndExt", arrNombreParametros,
                                                       arrParametros);
            }
            catch (Exception ex)
            {
                ex.Data.Add("execStoreProcedureSel", strNombreTabla);
                throw;
            }

            return dtTemp;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strNombreTabla"></param>
        /// <param name="arrParametrosSelect"></param>
        /// <param name="arrParametrosWhere"></param>
        /// <param name="arrParametrosValores"></param>
        /// <param name="strParamAdicionales"></param>
        /// <param name="myTrans"></param>
        /// <returns></returns>
        public DataTable ExecStoreProcedureSelOr(string strNombreTabla, ArrayList arrParametrosSelect,
                                                 ArrayList arrParametrosWhere, ArrayList arrParametrosValores,
                                                 string strParamAdicionales, ref CTrans myTrans)
        {
            DataTable dtTemp;

            var strParametrosSelect = new StringBuilder();

            var bPrimerElemento = true;
            foreach (string strSelect in arrParametrosSelect)
            {
                if (bPrimerElemento)
                {
                    strParametrosSelect.AppendLine(strSelect);
                    bPrimerElemento = false;
                }
                else
                {
                    strParametrosSelect.AppendLine(", " + strSelect);
                }
            }


            var strParametrosWhere = new StringBuilder();
            bPrimerElemento = true;
            for (var i = 0; i < arrParametrosWhere.Count - 1; i++)
            {
                if (bPrimerElemento)
                {
                    strParametrosWhere.AppendLine(arrParametrosWhere[i] + " = " + arrParametrosValores[i]);
                    bPrimerElemento = false;
                }
                else
                    strParametrosWhere.AppendLine(" OR " + strParametrosWhere);
            }


            var arrNombreParametros = new ArrayList {"Columnas", "ColumnasWhere", "Parametros"};
            var arrParametros = new ArrayList
            {
                strParametrosSelect.ToString(),
                strParametrosWhere.ToString(),
                strParamAdicionales
            };

            try
            {
                dtTemp = ExecStoreProcedureToDataTable("Sp" + strNombreTabla + "SelPickCndExt", arrNombreParametros,
                                                       arrParametros, ref myTrans);
            }
            catch (Exception ex)
            {
                ex.Data.Add("execStoreProcedureSel", strNombreTabla);
                throw;
            }

            return dtTemp;
        }

        #endregion


        #region Funciones: SpSel to DataReader

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strNombreTabla"></param>
        /// <returns></returns>
        public DbDataReader ExecStoreProcedureDataReaderSel(string strNombreTabla)
        {
            try
            {
                return ExecStoreProcedureToDbDataReader("Sp" + strNombreTabla + "Sel");
            }
            catch (Exception ex)
            {
                ex.Data.Add("execStoreProcedureSel", strNombreTabla);
                throw;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strNombreTabla"></param>
        /// <param name="myTrans"></param>
        /// <returns></returns>
        public DbDataReader ExecStoreProcedureDataReaderSel(string strNombreTabla, ref CTrans myTrans)
        {
            try
            {
                return ExecStoreProcedureToDbDataReader("Sp" + strNombreTabla + "Sel", ref myTrans);
            }
            catch (Exception ex)
            {
                ex.Data.Add("execStoreProcedureSel", strNombreTabla);
                throw;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strNombreTabla"></param>
        /// <param name="arrParametrosSelect"></param>
        /// <returns></returns>
        public DbDataReader ExecStoreProcedureDataReaderSel(string strNombreTabla, ArrayList arrParametrosSelect)
        {
            DbDataReader drReader;
            var strParametrosSelect = new StringBuilder();

            var bPrimerElemento = true;
            foreach (string strSelect in arrParametrosSelect)
            {
                if (bPrimerElemento)
                {
                    strParametrosSelect.AppendLine(strSelect);
                    bPrimerElemento = false;
                }
                else
                {
                    strParametrosSelect.AppendLine(", " + strSelect);
                }
            }

            var arrNombreParametros = new ArrayList {"Columnas"};
            var arrParametros = new ArrayList {strParametrosSelect.ToString()};

            try
            {
                drReader = ExecStoreProcedureToDbDataReader("Sp" + strNombreTabla + "SelPick", arrNombreParametros,
                                                       arrParametros);
            }
            catch (Exception ex)
            {
                ex.Data.Add("execStoreProcedureSel", strNombreTabla);
                throw;
            }

            return drReader;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strNombreTabla"></param>
        /// <param name="arrParametrosSelect"></param>
        /// <param name="myTrans"></param>
        /// <returns></returns>
        public DbDataReader ExecStoreProcedureDataReaderSel(string strNombreTabla, ArrayList arrParametrosSelect, ref CTrans myTrans)
        {
            DbDataReader drReader;

            var strParametrosSelect = new StringBuilder();

            var bPrimerElemento = true;
            foreach (string strSelect in arrParametrosSelect)
            {
                if (bPrimerElemento)
                {
                    strParametrosSelect.AppendLine(strSelect);
                    bPrimerElemento = false;
                }
                else
                {
                    strParametrosSelect.AppendLine(", " + strSelect);
                }
            }

            var arrNombreParametros = new ArrayList {"Columnas"};
            var arrParametros = new ArrayList {strParametrosSelect.ToString()};

            try
            {
                drReader = ExecStoreProcedureToDbDataReader("Sp" + strNombreTabla + "SelPick", arrNombreParametros,
                                                       arrParametros, ref myTrans);
            }
            catch (Exception ex)
            {
                ex.Data.Add("execStoreProcedureSel", strNombreTabla);
                throw;
            }

            return drReader;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strNombreTabla"></param>
        /// <param name="arrParametrosWhere"></param>
        /// <param name="arrParametrosValores"></param>
        /// <returns></returns>
        public DbDataReader ExecStoreProcedureDataReaderSel(string strNombreTabla, ArrayList arrParametrosWhere,
                                               ArrayList arrParametrosValores)
        {
            DbDataReader drReader;

            var strParametrosWhere = new StringBuilder();

            var bPrimerElemento = true;
            for (var i = 0; i < arrParametrosWhere.Count - 1; i++)
            {
                if (bPrimerElemento)
                {
                    strParametrosWhere.AppendLine(arrParametrosWhere[i] + " = " + arrParametrosValores[i]);
                    bPrimerElemento = false;
                }
                else
                {
                    strParametrosWhere.AppendLine(" AND " + strParametrosWhere);
                }
            }

            var arrNombreParametros = new ArrayList {"ColumnasWhere"};
            var arrParametros = new ArrayList {strParametrosWhere.ToString()};

            try
            {
                drReader = ExecStoreProcedureToDbDataReader("Sp" + strNombreTabla + "SelCnd", arrNombreParametros,
                                                       arrParametros);
            }
            catch (Exception ex)
            {
                ex.Data.Add("execStoreProcedureSel", strNombreTabla);
                throw;
            }

            return drReader;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strNombreTabla"></param>
        /// <param name="arrParametrosWhere"></param>
        /// <param name="arrParametrosValores"></param>
        /// <param name="myTrans"></param>
        /// <returns></returns>
        public DbDataReader ExecStoreProcedureDataReaderSel(string strNombreTabla, ArrayList arrParametrosWhere,
                                               ArrayList arrParametrosValores, ref CTrans myTrans)
        {
            DbDataReader drReader;

            var strParametrosWhere = new StringBuilder();

            var bPrimerElemento = true;
            for (var i = 0; i < arrParametrosWhere.Count - 1; i++)
            {
                if (bPrimerElemento)
                {
                    strParametrosWhere.AppendLine(arrParametrosWhere[i] + " = " + arrParametrosValores[i]);
                    bPrimerElemento = false;
                }
                else
                {
                    strParametrosWhere.AppendLine(" AND " + strParametrosWhere);
                }
            }

            var arrNombreParametros = new ArrayList {"ColumnasWhere"};
            var arrParametros = new ArrayList {strParametrosWhere.ToString()};

            try
            {
                drReader = ExecStoreProcedureToDbDataReader("Sp" + strNombreTabla + "SelCnd", arrNombreParametros,
                                                       arrParametros, ref myTrans);
            }
            catch (Exception ex)
            {
                ex.Data.Add("execStoreProcedureSel", strNombreTabla);
                throw;
            }

            return drReader;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strNombreTabla"></param>
        /// <param name="arrParametrosSelect"></param>
        /// <param name="arrParametrosWhere"></param>
        /// <param name="arrParametrosValores"></param>
        /// <returns></returns>
        public DbDataReader ExecStoreProcedureDataReaderSel(string strNombreTabla, ArrayList arrParametrosSelect,
                                               ArrayList arrParametrosWhere, ArrayList arrParametrosValores)
        {
            DbDataReader drReader;

            var strParametrosSelect = new StringBuilder();

            var bPrimerElemento = true;
            foreach (string strSelect in arrParametrosSelect)
            {
                if (bPrimerElemento)
                {
                    strParametrosSelect.AppendLine(strSelect);
                    bPrimerElemento = false;
                }
                else
                {
                    strParametrosSelect.AppendLine(", " + strSelect);
                }
            }

            var strParametrosWhere = new StringBuilder();
            bPrimerElemento = true;
            for (var i = 0; i < arrParametrosWhere.Count - 1; i++)
            {
                if (bPrimerElemento)
                {
                    strParametrosWhere.AppendLine(arrParametrosWhere[i] + " = " + arrParametrosValores[i]);
                    bPrimerElemento = false;
                }
                else
                {
                    strParametrosWhere.AppendLine(" AND " + strParametrosWhere);
                }
            }

            var arrNombreParametros = new ArrayList {"Columnas", "ColumnasWhere"};
            var arrParametros = new ArrayList {strParametrosSelect.ToString(), strParametrosWhere.ToString()};

            try
            {
                drReader = ExecStoreProcedureToDbDataReader("Sp" + strNombreTabla + "SelPickCnd", arrNombreParametros,
                                                       arrParametros);
            }
            catch (Exception ex)
            {
                ex.Data.Add("execStoreProcedureSel", strNombreTabla);
                throw;
            }

            return drReader;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strNombreTabla"></param>
        /// <param name="arrParametrosSelect"></param>
        /// <param name="arrParametrosWhere"></param>
        /// <param name="arrParametrosValores"></param>
        /// <param name="myTrans"></param>
        /// <returns></returns>
        public DbDataReader ExecStoreProcedureDataReaderSel(string strNombreTabla, ArrayList arrParametrosSelect,
                                               ArrayList arrParametrosWhere, ArrayList arrParametrosValores,
                                               ref CTrans myTrans)
        {
            DbDataReader drReader;

            var strParametrosSelect = new StringBuilder();

            var bPrimerElemento = true;
            foreach (string strSelect in arrParametrosSelect)
            {
                if (bPrimerElemento)
                {
                    strParametrosSelect.AppendLine(strSelect);
                    bPrimerElemento = false;
                }
                else
                {
                    strParametrosSelect.AppendLine(", " + strSelect);
                }
            }

            var strParametrosWhere = new StringBuilder();
            bPrimerElemento = true;
            for (var i = 0; i < arrParametrosWhere.Count - 1; i++)
            {
                if (bPrimerElemento)
                {
                    strParametrosWhere.AppendLine(arrParametrosWhere[i] + " = " + arrParametrosValores[i]);
                    bPrimerElemento = false;
                }
                else
                {
                    strParametrosWhere.AppendLine(" AND " + strParametrosWhere);
                }
            }

            var arrNombreParametros = new ArrayList {"Columnas", "ColumnasWhere"};
            var arrParametros = new ArrayList {strParametrosSelect.ToString(), strParametrosWhere.ToString()};

            try
            {
                drReader = ExecStoreProcedureToDbDataReader("Sp" + strNombreTabla + "SelPickCnd", arrNombreParametros,
                                                       arrParametros, ref myTrans);
            }
            catch (Exception ex)
            {
                ex.Data.Add("execStoreProcedureSel", strNombreTabla);
                throw;
            }

            return drReader;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strNombreTabla"></param>
        /// <param name="arrParametrosSelect"></param>
        /// <param name="arrParametrosWhere"></param>
        /// <param name="arrParametrosValores"></param>
        /// <param name="strParamAdicionales"></param>
        /// <returns></returns>
        public DbDataReader ExecStoreProcedureDataReaderSel(string strNombreTabla, ArrayList arrParametrosSelect,
                                               ArrayList arrParametrosWhere, ArrayList arrParametrosValores,
                                               string strParamAdicionales)
        {
            DbDataReader drReader;

            var strParametrosSelect = new StringBuilder();

            var bPrimerElemento = true;
            foreach (string strSelect in arrParametrosSelect)
            {
                if (bPrimerElemento)
                {
                    strParametrosSelect.AppendLine(strSelect);
                    bPrimerElemento = false;
                }
                else
                {
                    strParametrosSelect.AppendLine(", " + strSelect);
                }
            }


            var strParametrosWhere = new StringBuilder();
            bPrimerElemento = true;
            for (var i = 0; i < arrParametrosWhere.Count - 1; i++)
            {
                if (bPrimerElemento)
                {
                    strParametrosWhere.AppendLine(arrParametrosWhere[i] + " = " + arrParametrosValores[i]);
                    bPrimerElemento = false;
                }
                else
                {
                    strParametrosWhere.AppendLine(" AND " + strParametrosWhere);
                }
            }


            var arrNombreParametros = new ArrayList {"Columnas", "ColumnasWhere", "Parametros"};
            var arrParametros = new ArrayList
            {
                strParametrosSelect.ToString(),
                strParametrosWhere.ToString(),
                strParamAdicionales
            };

            try
            {
                drReader = ExecStoreProcedureToDbDataReader("Sp" + strNombreTabla + "SelPickCndExt", arrNombreParametros,
                                                       arrParametros);
            }
            catch (Exception ex)
            {
                ex.Data.Add("execStoreProcedureSel", strNombreTabla);
                throw;
            }

            return drReader;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strNombreTabla"></param>
        /// <param name="arrParametrosSelect"></param>
        /// <param name="arrParametrosWhere"></param>
        /// <param name="arrParametrosValores"></param>
        /// <param name="strParamAdicionales"></param>
        /// <param name="myTrans"></param>
        /// <returns></returns>
        public DbDataReader ExecStoreProcedureDataReaderSel(string strNombreTabla, ArrayList arrParametrosSelect,
                                               ArrayList arrParametrosWhere, ArrayList arrParametrosValores,
                                               string strParamAdicionales, ref CTrans myTrans)
        {
            DbDataReader drReader;

            var strParametrosSelect = new StringBuilder();

            var bPrimerElemento = true;
            foreach (string strSelect in arrParametrosSelect)
            {
                if (bPrimerElemento)
                {
                    strParametrosSelect.AppendLine(strSelect);
                    bPrimerElemento = false;
                }
                else
                {
                    strParametrosSelect.AppendLine(", " + strSelect);
                }
            }

            var strParametrosWhere = new StringBuilder();
            bPrimerElemento = true;
            for (var i = 0; i < arrParametrosWhere.Count - 1; i++)
            {
                if (bPrimerElemento)
                {
                    strParametrosWhere.AppendLine(arrParametrosWhere[i] + " = " + arrParametrosValores[i]);
                    bPrimerElemento = false;
                }
                else
                {
                    strParametrosWhere.AppendLine(" AND " + strParametrosWhere);
                }
            }


            var arrNombreParametros = new ArrayList {"Columnas", "ColumnasWhere", "Parametros"};
            var arrParametros = new ArrayList
            {
                strParametrosSelect.ToString(),
                strParametrosWhere.ToString(),
                strParamAdicionales
            };

            try
            {
                drReader = ExecStoreProcedureToDbDataReader("Sp" + strNombreTabla + "SelPickCndExt", arrNombreParametros,
                                                       arrParametros, ref myTrans);
            }
            catch (Exception ex)
            {
                ex.Data.Add("execStoreProcedureSel", strNombreTabla);
                throw;
            }

            return drReader;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strNombreTabla"></param>
        /// <param name="arrParametrosSelect"></param>
        /// <param name="arrParametrosWhere"></param>
        /// <param name="arrParametrosValores"></param>
        /// <returns></returns>
        public DbDataReader ExecStoreProcedureDataReaderSelOr(string strNombreTabla, ArrayList arrParametrosSelect,
                                                 ArrayList arrParametrosWhere, ArrayList arrParametrosValores)
        {
            DbDataReader drReader;

            var strParametrosSelect = new StringBuilder();

            var bPrimerElemento = true;
            foreach (string strSelect in arrParametrosSelect)
            {
                if (bPrimerElemento)
                {
                    strParametrosSelect.AppendLine(strSelect);
                    bPrimerElemento = false;
                }
                else
                {
                    strParametrosSelect.AppendLine(", " + strSelect);
                }
            }


            var strParametrosWhere = new StringBuilder();
            bPrimerElemento = true;
            for (var i = 0; i < arrParametrosWhere.Count - 1; i++)
            {
                if (bPrimerElemento)
                {
                    strParametrosWhere.AppendLine(arrParametrosWhere[i] + " = " + arrParametrosValores[i]);
                    bPrimerElemento = false;
                }
                else
                    strParametrosWhere.AppendLine(" OR " + strParametrosWhere);
            }

            var arrNombreParametros = new ArrayList {"Columnas", "ColumnasWhere"};
            var arrParametros = new ArrayList {strParametrosSelect.ToString(), strParametrosWhere.ToString()};

            try
            {
                drReader = ExecStoreProcedureToDbDataReader("Sp" + strNombreTabla + "SelPickCnd", arrNombreParametros,
                                                       arrParametros);
            }
            catch (Exception ex)
            {
                ex.Data.Add("execStoreProcedureSel", strNombreTabla);
                throw;
            }

            return drReader;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strNombreTabla"></param>
        /// <param name="arrParametrosSelect"></param>
        /// <param name="arrParametrosWhere"></param>
        /// <param name="arrParametrosValores"></param>
        /// <param name="myTrans"></param>
        /// <returns></returns>
        public DbDataReader ExecStoreProcedureDataReaderSelOr(string strNombreTabla, ArrayList arrParametrosSelect,
                                                 ArrayList arrParametrosWhere, ArrayList arrParametrosValores,
                                                 ref CTrans myTrans)
        {
            DbDataReader drReader;

            var strParametrosSelect = new StringBuilder();

            var bPrimerElemento = true;
            foreach (string strSelect in arrParametrosSelect)
            {
                if (bPrimerElemento)
                {
                    strParametrosSelect.AppendLine(strSelect);
                    bPrimerElemento = false;
                }
                else
                {
                    strParametrosSelect.AppendLine(", " + strSelect);
                }
            }


            var strParametrosWhere = new StringBuilder();
            bPrimerElemento = true;
            for (var i = 0; i < arrParametrosWhere.Count - 1; i++)
            {
                if (bPrimerElemento)
                {
                    strParametrosWhere.AppendLine(arrParametrosWhere[i] + " = " + arrParametrosValores[i]);
                    bPrimerElemento = false;
                }
                else
                    strParametrosWhere.AppendLine(" OR " + strParametrosWhere);
            }

            var arrNombreParametros = new ArrayList {"Columnas", "ColumnasWhere"};
            var arrParametros = new ArrayList {strParametrosSelect.ToString(), strParametrosWhere.ToString()};

            try
            {
                drReader = ExecStoreProcedureToDbDataReader("Sp" + strNombreTabla + "SelPickCnd", arrNombreParametros,
                                                       arrParametros);
            }
            catch (Exception ex)
            {
                ex.Data.Add("execStoreProcedureSel", strNombreTabla);
                throw;
            }

            return drReader;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strNombreTabla"></param>
        /// <param name="arrParametrosSelect"></param>
        /// <param name="arrParametrosWhere"></param>
        /// <param name="arrParametrosValores"></param>
        /// <param name="strParamAdicionales"></param>
        /// <returns></returns>
        public DbDataReader ExecStoreProcedureDataReaderSelOr(string strNombreTabla, ArrayList arrParametrosSelect,
                                                 ArrayList arrParametrosWhere, ArrayList arrParametrosValores,
                                                 string strParamAdicionales)
        {
            DbDataReader drReader;

            var strParametrosSelect = new StringBuilder();

            var bPrimerElemento = true;
            foreach (string strSelect in arrParametrosSelect)
            {
                if (bPrimerElemento)
                {
                    strParametrosSelect.AppendLine(strSelect);
                    bPrimerElemento = false;
                }
                else
                {
                    strParametrosSelect.AppendLine(", " + strSelect);
                }
            }

            var strParametrosWhere = new StringBuilder();
            bPrimerElemento = true;
            for (var i = 0; i < arrParametrosWhere.Count - 1; i++)
            {
                if (bPrimerElemento)
                {
                    strParametrosWhere.AppendLine(arrParametrosWhere[i] + " = " + arrParametrosValores[i]);
                    bPrimerElemento = false;
                }
                else
                    strParametrosWhere.AppendLine(" OR " + strParametrosWhere);
            }


            var arrNombreParametros = new ArrayList {"Columnas", "ColumnasWhere", "Parametros"};
            var arrParametros = new ArrayList
            {
                strParametrosSelect.ToString(),
                strParametrosWhere.ToString(),
                strParamAdicionales
            };

            try
            {
                drReader = ExecStoreProcedureToDbDataReader("Sp" + strNombreTabla + "SelPickCndExt", arrNombreParametros,
                                                       arrParametros);
            }
            catch (Exception ex)
            {
                ex.Data.Add("execStoreProcedureSel", strNombreTabla);
                throw;
            }

            return drReader;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strNombreTabla"></param>
        /// <param name="arrParametrosSelect"></param>
        /// <param name="arrParametrosWhere"></param>
        /// <param name="arrParametrosValores"></param>
        /// <param name="strParamAdicionales"></param>
        /// <param name="myTrans"></param>
        /// <returns></returns>
        public DbDataReader ExecStoreProcedureDataReaderSelOr(string strNombreTabla, ArrayList arrParametrosSelect,
                                                 ArrayList arrParametrosWhere, ArrayList arrParametrosValores,
                                                 string strParamAdicionales, ref CTrans myTrans)
        {
            DbDataReader drReader;

            var strParametrosSelect = new StringBuilder();

            var bPrimerElemento = true;
            foreach (string strSelect in arrParametrosSelect)
            {
                if (bPrimerElemento)
                {
                    strParametrosSelect.AppendLine(strSelect);
                    bPrimerElemento = false;
                }
                else
                {
                    strParametrosSelect.AppendLine(", " + strSelect);
                }
            }


            var strParametrosWhere = new StringBuilder();
            bPrimerElemento = true;
            for (var i = 0; i < arrParametrosWhere.Count - 1; i++)
            {
                if (bPrimerElemento)
                {
                    strParametrosWhere.AppendLine(arrParametrosWhere[i] + " = " + arrParametrosValores[i]);
                    bPrimerElemento = false;
                }
                else
                    strParametrosWhere.AppendLine(" OR " + strParametrosWhere);
            }

            var arrNombreParametros = new ArrayList {"Columnas", "ColumnasWhere", "Parametros"};
            var arrParametros = new ArrayList
            {
                strParametrosSelect.ToString(),
                strParametrosWhere.ToString(),
                strParamAdicionales
            };

            try
            {
                drReader = ExecStoreProcedureToDbDataReader("Sp" + strNombreTabla + "SelPickCndExt", arrNombreParametros,
                                                       arrParametros, ref myTrans);
            }
            catch (Exception ex)
            {
                ex.Data.Add("execStoreProcedureSel", strNombreTabla);
                throw;
            }

            return drReader;
        }

        #endregion

        #region Funciones: Ejecutar SP

        /// <summary>
        ///   Metodo que ejecuta un Procedimiento Almacenado
        /// </summary>
        /// <param name="nombreSp" type="string">
        ///   <para>
        ///     Nombre del Stored procedure
        ///   </para>
        /// </param>
        /// <param name="arrParametros" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los parametros
        ///   </para>
        /// </param>
        /// <returns>
        ///   Devuelve TRUE o FALSE dependiendo del éxito de la Operacion
        /// </returns>
        public bool ExecStoreProcedure(string nombreSp, ArrayList arrParametros)
        {
            var command = new NpgsqlCommand();
            command.CommandText = nombreSp;
            command.CommandType = CommandType.StoredProcedure;

            try
            {
                for (var intContador = 0; intContador < arrParametros.Count; intContador++)
                {
                    if (arrParametros[intContador] == null)
                    {
                        command.Parameters.Add(new NpgsqlParameter("@" + intContador, DBNull.Value));
                    }
                    else
                    {
                        switch (arrParametros[intContador].GetType().ToString())
                        {
                            case "System.Int32":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, NpgsqlDbType.Integer, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, NpgsqlDbType.Integer, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               arrParametros[intContador]));
                                }
                                break;
                            case "System.Decimal":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               arrParametros[intContador]));
                                }
                                break;
                            case "System.String":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador,
                                                                               arrParametros[intContador]));
                                    command.Parameters["@" + intContador].NpgsqlDbType = NpgsqlDbType.Text;
                                }
                                break;
                            case "System.DateTime":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador,
                                                                               arrParametros[intContador]));
                                    command.Parameters["@" + intContador].NpgsqlDbType = NpgsqlDbType.Timestamp;
                                }
                                break;
                            case "System.Numerics.BigInteger":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, DBNull.Value));
                                }
                                else
                                {                                    
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador,
                                                                               arrParametros[intContador]));
                                    command.Parameters["@" + intContador].NpgsqlDbType = NpgsqlDbType.Bigint;
                                }
                                break;
                            default:
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador,
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador,
                                                                               arrParametros[intContador]));
                                }
                                break;
                        }
                    }
                }
                command.Connection = ConexionBd;
                command.ExecuteNonQuery();
                command.Connection.Close();
                command.Dispose();
                return true;
            }
            catch (Exception ex)
            {
                ex.Data.Add("StoredProcedure", nombreSp);
                throw;
            }
        }

        /// <summary>
        ///   Metodo que ejecuta un Procedimiento Almacenado
        /// </summary>
        /// <param name="nombreSp" type="string">
        ///   <para>
        ///     Nombre del Stored procedure
        ///   </para>
        /// </param>
        /// <param name="arrParametros" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los parametros
        ///   </para>
        /// </param>
        /// <param name="myTrans" type="Conexion.cTrans">
        ///   <para>
        ///     Objeto que contiene la Transaccion activa utilizada para realizar la operacion
        ///   </para>
        /// </param>
        /// <returns>
        ///   Devuelve TRUE o FALSE dependiendo del éxito de la Operacion
        /// </returns>
        public bool ExecStoreProcedure(string nombreSp, ArrayList arrParametros, ref CTrans myTrans)
        {
            var command = new NpgsqlCommand
            {
                CommandText = nombreSp,
                CommandType = CommandType.StoredProcedure
            };

            try
            {
                for (var intContador = 0; intContador < arrParametros.Count; intContador++)
                {
                    if (arrParametros[intContador] == null)
                    {
                        command.Parameters.Add(new NpgsqlParameter("@" + intContador, DBNull.Value));
                    }
                    else
                    {
                        switch (arrParametros[intContador].GetType().ToString())
                        {
                            case "System.Int32":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, NpgsqlDbType.Integer, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, NpgsqlDbType.Integer, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               arrParametros[intContador]));
                                }
                                break;
                            case "System.Decimal":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               arrParametros[intContador]));
                                }
                                break;
                            case "System.String":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador,
                                                                               arrParametros[intContador]));
                                    command.Parameters["@" + intContador].NpgsqlDbType = NpgsqlDbType.Text;
                                }
                                break;
                            case "System.DateTime":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador,
                                                                               arrParametros[intContador]));
                                    command.Parameters["@" + intContador].NpgsqlDbType = NpgsqlDbType.Timestamp;
                                }
                                break;
                            case "System.Numerics.BigInteger":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador,
                                                                               arrParametros[intContador]));
                                    command.Parameters["@" + intContador].NpgsqlDbType = NpgsqlDbType.Bigint;
                                }
                                break;
                            default:
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador,
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador,
                                                                               arrParametros[intContador]));
                                }
                                break;
                        }
                    }
                }
                command.Connection = myTrans.MyConn;
                command.ExecuteNonQuery();
                command.Connection.Close();
                command.Dispose();
                return true;
            }
            catch (Exception ex)
            {
                ex.Data.Add("StoredProcedure", nombreSp);
                throw;
            }
        }

        /// <summary>
        ///   Metodo que ejecuta un Procedimiento Almacenado
        /// </summary>
        /// <param name="nombreSp" type="string">
        ///   <para>
        ///     Nombre del Stored procedure
        ///   </para>
        /// </param>
        /// <param name="arrNombreParametros" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los nombres de los parametros
        ///   </para>
        /// </param>
        /// <param name="arrParametros" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los parametros
        ///   </para>
        /// </param>
        /// <returns>
        ///   Número de registros afectados
        /// </returns>
        public int ExecStoreProcedure(string nombreSp, ArrayList arrNombreParametros, ArrayList arrParametros)
        {
            var command = new NpgsqlCommand();
            command.CommandText = nombreSp;
            command.CommandType = CommandType.StoredProcedure;

            try
            {
                for (var intContador = 0; intContador < arrParametros.Count; intContador++)
                {
                    if (arrParametros[intContador] == null)
                    {
                        command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], DBNull.Value));
                        command.Parameters["@" + arrNombreParametros[intContador]].NpgsqlDbType = NpgsqlDbType.Text;
                    }
                    else
                    {
                        switch (arrParametros[intContador].GetType().ToString())
                        {
                            case "System.Byte[]":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], arrParametros[intContador]));
                                    command.Parameters["@" + arrNombreParametros[intContador]].NpgsqlDbType = NpgsqlDbType.Bytea;
                                }
                                break;
                            case "System.Int32":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               arrParametros[intContador]));
                                }
                                break;
                            case "System.Int64":
                            case "System.Decimal":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               arrParametros[intContador]));
                                }
                                break;                            
                            case "System.String":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                                               arrParametros[intContador]));
                                    command.Parameters["@" + arrNombreParametros[intContador]].NpgsqlDbType = NpgsqlDbType.Text;
                                }
                                break;
                            case "System.DateTime":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                                               arrParametros[intContador]));
                                    command.Parameters["@" + arrNombreParametros[intContador]].NpgsqlDbType = NpgsqlDbType.Timestamp;
                                }
                                break;
                            case "System.Numerics.BigInteger":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                                               arrParametros[intContador]));
                                    command.Parameters["@" + arrNombreParametros[intContador]].NpgsqlDbType = NpgsqlDbType.Bigint;
                                }
                                break;
                            default:
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], arrParametros[intContador]));
                                }
                                break;
                        }
                    }
                }
                command.Connection = ConexionBd;

                command.Connection.Open();
                var intRes = command.ExecuteNonQuery();

                command.Connection.Close();
                command.Dispose();
                return intRes;
            }
            catch (Exception ex)
            {
                ex.Data.Add("StoredProcedure", nombreSp);
                throw;
            }
        }

        /// <summary>
        ///   Metodo que ejecuta un Procedimiento Almacenado
        /// </summary>
        /// <param name="nombreSp" type="string">
        ///   <para>
        ///     Nombre del Stored procedure
        ///   </para>
        /// </param>
        /// <param name="arrNombreParametros" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los nombres de los parametros
        ///   </para>
        /// </param>
        /// <param name="arrParametros" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los parametros
        ///   </para>
        /// </param>
        /// <param name="trans" type="Conexion.cTrans">
        ///   <para>
        ///     Objeto que contiene la Transaccion activa utilizada para realizar la operacion
        ///   </para>
        /// </param>
        /// <returns>
        ///   Número de registros afectados
        /// </returns>
        public int ExecStoreProcedure(string nombreSp, ArrayList arrNombreParametros, ArrayList arrParametros,
                                      ref CTrans trans)
        {
            var command = new NpgsqlCommand();
            command.CommandText = nombreSp;
            command.CommandType = CommandType.StoredProcedure;

            try
            {
                for (var intContador = 0; intContador < arrParametros.Count; intContador++)
                {
                    if (arrParametros[intContador] == null)
                    {
                        command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                                   DBNull.Value));
                    }
                    else
                    {
                        switch (arrParametros[intContador].GetType().ToString())
                        {
                            case "System.Byte[]":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], arrParametros[intContador]));
                                    command.Parameters["@" + arrNombreParametros[intContador]].NpgsqlDbType = NpgsqlDbType.Bytea;
                                }
                                break;
                            case "System.Int32":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               arrParametros[intContador]));
                                }
                                break;
                            case "System.Decimal":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               arrParametros[intContador]));
                                }
                                break;
                            case "System.String":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], DBNull.Value));
                                }
                                else
                                {

                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                                               arrParametros[intContador]));
                                    command.Parameters["@" + arrNombreParametros[intContador]].NpgsqlDbType = NpgsqlDbType.Text;
                                }
                                break;
                            case "System.DateTime":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                                               arrParametros[intContador]));
                                    command.Parameters["@" + arrNombreParametros[intContador]].NpgsqlDbType = NpgsqlDbType.Timestamp;
                                }
                                break;
                            case "System.Numerics.BigInteger":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                                               arrParametros[intContador]));
                                    command.Parameters["@" + arrNombreParametros[intContador]].NpgsqlDbType = NpgsqlDbType.Bigint;
                                }
                                break;
                            default:
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                                               arrParametros[intContador]));
                                }
                                break;
                        }
                    }
                }
                command.Connection = trans.MyConn;
                command.Transaction = trans.MyTrans;

                var intRes = command.ExecuteNonQuery();

                return intRes;
            }
            catch (Exception ex)
            {
                ex.Data.Add("StoredProcedure", nombreSp);
                throw;
            }
        }

        /// <summary>
        ///   Metodo que ejecuta un Procedimiento Almacenado y devuelve la Identidad Recuperada
        /// </summary>
        /// <param name="nombreSp" type="string">
        ///   <para>
        ///     Nombre del Stored procedure
        ///   </para>
        /// </param>
        /// <param name="arrParametros" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los nombres de los parametros
        ///   </para>
        /// </param>
        /// <param name="arrParametros" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los parametros
        ///   </para>
        /// </param>
        /// <returns>
        ///   Identidad insertada
        /// </returns>
        public object ExecStoreProcedureIdentity(string nombreSp, ArrayList arrNombreParametros, ArrayList arrParametros)
        {
            var command = new NpgsqlCommand();
            command.CommandText = nombreSp;
            command.CommandType = CommandType.StoredProcedure;

            try
            {
                //Primero la identidad 
                command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[0], arrParametros[0]));
                command.Parameters["@" + arrNombreParametros[0]].Direction = ParameterDirection.Output;
                command.Parameters["@" + arrNombreParametros[0]].Size = 30;

                for (var intContador = 1; intContador < arrParametros.Count; intContador++)
                {
                    //Verificamos si el parametro es ID o ID_PERS

                    if (arrParametros[intContador] == null)
                    {
                        command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                                   DBNull.Value));
                    }
                    else
                    {
                        switch (arrParametros[intContador].GetType().ToString())
                        {
                            case "System.Byte[]":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], arrParametros[intContador]));
                                    command.Parameters["@" + arrNombreParametros[intContador]].NpgsqlDbType = NpgsqlDbType.Bytea;
                                }
                                break;
                            case "System.Int32":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], NpgsqlDbType.Integer, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], NpgsqlDbType.Integer, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               arrParametros[intContador]));
                                }
                                break;
                            case "System.Decimal":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               arrParametros[intContador]));
                                }
                                break;
                            case "System.String":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                                               arrParametros[intContador]));
                                    command.Parameters["@" + arrNombreParametros[intContador]].NpgsqlDbType = NpgsqlDbType.Text;
                                }
                                break;
                            case "System.DateTime":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                                               arrParametros[intContador]));
                                    command.Parameters["@" + arrNombreParametros[intContador]].NpgsqlDbType = NpgsqlDbType.Timestamp;
                                }
                                break;
                            case "System.Numerics.BigInteger":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                                               arrParametros[intContador]));
                                    command.Parameters["@" + arrNombreParametros[intContador]].NpgsqlDbType = NpgsqlDbType.Bigint;
                                }
                                break;
                            default:
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                                               arrParametros[intContador]));
                                }
                                break;
                        }
                    }

                }

                command.Connection = ConexionBd;

                command.Connection.Open();
                command.ExecuteNonQuery();

                var valorDevuelto = command.Parameters["@" + arrNombreParametros[0]].Value;

                command.Connection.Close();
                command.Dispose();

                return valorDevuelto;
            }
            catch (Exception ex)
            {
                ex.Data.Add("StoredProcedure", nombreSp);
                throw;
            }
        }

        /// <summary>
        ///   Metodo que ejecuta un Procedimiento Almacenado y devuelve la Identidad Recuperada
        /// </summary>
        /// <param name="nombreSp" type="string">
        ///   <para>
        ///     Nombre del Stored procedure
        ///   </para>
        /// </param>
        /// <param name="arrParametros" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los nombres de los parametros
        ///   </para>
        /// </param>
        /// <param name="arrParametros" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los parametros
        ///   </para>
        /// </param>
        /// <param name="trans" type="Conexion.cTrans">
        ///   <para>
        ///     Objeto que contiene la Transaccion activa utilizada para realizar la operacion
        ///   </para>
        /// </param>
        /// <returns>
        ///   Identidad insertada
        /// </returns>
        public object ExecStoreProcedureIdentity(string nombreSp, ArrayList arrNombreParametros, ArrayList arrParametros,
                                                 ref CTrans trans)
        {
            var command = new NpgsqlCommand();
            command.CommandText = nombreSp;
            command.CommandType = CommandType.StoredProcedure;

            try
            {
                //Primero la identidad 
                command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[0], arrParametros[0]));
                command.Parameters["@" + arrNombreParametros[0]].Direction = ParameterDirection.Output;
                command.Parameters["@" + arrNombreParametros[0]].Size = 30;

                for (var intContador = 1; intContador < arrParametros.Count; intContador++)
                {
                    //Verificamos si el parametro es ID o ID_PERS

                    if (arrParametros[intContador] == null)
                    {
                        command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                                   DBNull.Value));
                    }
                    else
                    {
                        switch (arrParametros[intContador].GetType().ToString())
                        {
                            case "System.Byte[]":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], arrParametros[intContador]));
                                    command.Parameters["@" + arrNombreParametros[intContador]].NpgsqlDbType = NpgsqlDbType.Bytea;
                                }
                                break;
                            case "System.Int32":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], NpgsqlDbType.Integer,
                                                                               4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], NpgsqlDbType.Integer,
                                                                               4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               arrParametros[intContador]));
                                }
                                break;
                            case "System.Decimal":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], NpgsqlDbType.Numeric,
                                                                               4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], NpgsqlDbType.Numeric,
                                                                               4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               arrParametros[intContador]));
                                }
                                break;                            
                            case "System.DateTime":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(
                                        new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                            arrParametros[intContador]));
                                    command.Parameters["@" + arrNombreParametros[intContador]].NpgsqlDbType =
                                        NpgsqlDbType.Timestamp;
                                }
                                break;
                            case "System.Numerics.BigInteger":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(
                                        new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                            arrParametros[intContador]));
                                    command.Parameters["@" + arrNombreParametros[intContador]].NpgsqlDbType =
                                        NpgsqlDbType.Bigint;
                                }
                                break;
                            default:
                                //Strings y demas
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(
                                        new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                            DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(
                                        new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                            arrParametros[intContador]));
                                    command.Parameters["@" + arrNombreParametros[intContador]].NpgsqlDbType =
                                        NpgsqlDbType.Text;
                                }
                                break;
                        }
                    }

                }
                command.Connection = trans.MyConn;
                command.Transaction = trans.MyTrans;

                command.ExecuteNonQuery();

                var valorDevuelto = command.Parameters["@" + arrNombreParametros[0]].Value;

                return valorDevuelto;
            }
            catch (Exception ex)
            {
                ex.Data.Add("StoredProcedure", nombreSp);
                throw;
            }
        }

        #endregion

        #region Funciones: Ejecutar SPs a un DataTable

        /// <summary>
        ///   Metodo que ejecuta un Procedimiento Almacenado
        /// </summary>
        /// <param name="nombreSp" type="string">
        ///   <para>
        ///     Nombre del Stored procedure
        ///   </para>
        /// </param>
        /// <returns>
        ///   Devuelve un DataTable con el resultado de la consulta
        /// </returns>
        public DataTable ExecStoreProcedureToDataTable(string nombreSp)
        {
            var command = new NpgsqlCommand();
            command.CommandText = nombreSp;
            command.CommandType = CommandType.StoredProcedure;

            try
            {
                command.Connection = ConexionBd;

                var da = new NpgsqlDataAdapter(command);

                var dtTemp = new DataTable();
                da.Fill(dtTemp);

                command.Connection.Close();
                command.Dispose();
                return dtTemp;
            }
            catch (Exception ex)
            {
                ex.Data.Add("StoredProcedure", nombreSp);
                throw;
            }
        }

        /// <summary>
        ///   Metodo que ejecuta un Procedimiento Almacenado
        /// </summary>
        /// <param name="nombreSp" type="string">
        ///   <para>
        ///     Nombre del Stored procedure
        ///   </para>
        /// </param>
        /// <param name="myTrans" type="Conexion.cTrans">
        ///   <para>
        ///     Objeto que contiene la Transaccion activa utilizada para realizar la operacion
        ///   </para>
        /// </param>
        /// <returns>
        ///   Devuelve un DataTable con el resultado de la consulta
        /// </returns>
        public DataTable ExecStoreProcedureToDataTable(string nombreSp, ref CTrans myTrans)
        {
            var command = new NpgsqlCommand();
            command.CommandText = nombreSp;
            command.CommandType = CommandType.StoredProcedure;

            try
            {
                command.Connection = myTrans.MyConn;
                command.Transaction = myTrans.MyTrans;

                var da = new NpgsqlDataAdapter(command);

                var dtTemp = new DataTable();
                da.Fill(dtTemp);

                command.Connection.Close();
                command.Dispose();
                return dtTemp;
            }
            catch (Exception ex)
            {
                ex.Data.Add("StoredProcedure", nombreSp);
                throw;
            }
        }

        /// <summary>
        ///   Metodo que ejecuta un Procedimiento Almacenado
        /// </summary>
        /// <param name="nombreSp" type="string">
        ///   <para>
        ///     Nombre del Stored procedure
        ///   </para>
        /// </param>
        /// <param name="arrParametros" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los parametros
        ///   </para>
        /// </param>
        /// <returns>
        ///   Devuelve un DataTable con el resultado de la consulta
        /// </returns>
        public DataTable ExecStoreProcedureToDataTable(string nombreSp, ArrayList arrParametros)
        {
            var command = new NpgsqlCommand();
            command.CommandText = nombreSp;
            command.CommandType = CommandType.StoredProcedure;

            try
            {
                for (var intContador = 0; intContador < arrParametros.Count; intContador++)
                {
                    if (arrParametros[intContador] == null)
                    {
                        command.Parameters.Add(new NpgsqlParameter(arrParametros[intContador].ToString(), DBNull.Value));
                    }
                    else
                    {
                        switch (arrParametros[intContador].GetType().ToString())
                        {
                            case "System.Int32":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               arrParametros[intContador]));
                                }
                                break;
                            case "System.Decimal":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               arrParametros[intContador]));
                                }
                                break;
                            case "System.String":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador,
                                                                               arrParametros[intContador]));
                                    command.Parameters["@" + intContador].NpgsqlDbType = NpgsqlDbType.Text;
                                }
                                break;
                            case "System.DateTime":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador,
                                                                               arrParametros[intContador]));
                                    command.Parameters["@" + intContador].NpgsqlDbType = NpgsqlDbType.Timestamp;
                                }
                                break;
                            default:
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador,
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador,
                                                                               arrParametros[intContador]));
                                }
                                break;
                        }
                    }
                }

                command.Connection = ConexionBd;

                var da = new NpgsqlDataAdapter(command);

                var dtTemp = new DataTable();
                da.Fill(dtTemp);

                command.Connection.Close();
                command.Dispose();
                return dtTemp;
            }
            catch (Exception ex)
            {
                ex.Data.Add("StoredProcedure", nombreSp);
                throw;
            }
        }

        /// <summary>
        ///   Metodo que ejecuta un Procedimiento Almacenado
        /// </summary>
        /// <param name="nombreSp" type="string">
        ///   <para>
        ///     Nombre del Stored procedure
        ///   </para>
        /// </param>
        /// <param name="arrParametros" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los parametros
        ///   </para>
        /// </param>
        /// <param name="trans" type="Conexion.cTrans">
        ///   <para>
        ///     Objeto que contiene la Transaccion activa utilizada para realizar la operacion
        ///   </para>
        /// </param>
        /// <returns>
        ///   Devuelve un DataTable con el resultado de la consulta
        /// </returns>
        public DataTable ExecStoreProcedureToDataTable(string nombreSp, ArrayList arrParametros, ref CTrans trans)
        {
            var command = new NpgsqlCommand();
            command.CommandText = nombreSp;
            command.CommandType = CommandType.StoredProcedure;

            try
            {
                for (var intContador = 0; intContador < arrParametros.Count; intContador++)
                {
                    if (arrParametros[intContador] == null)
                    {
                        command.Parameters.Add(new NpgsqlParameter(arrParametros[intContador].ToString(), DBNull.Value));
                    }
                    else
                    {
                        switch (arrParametros[intContador].GetType().ToString())
                        {
                            case "System.Int32":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               arrParametros[intContador]));
                                }
                                break;
                            case "System.Decimal":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               arrParametros[intContador]));
                                }
                                break;
                            case "System.String":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador,
                                                                               arrParametros[intContador]));
                                    command.Parameters["@" + intContador].NpgsqlDbType = NpgsqlDbType.Text;
                                }
                                break;
                            case "System.DateTime":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador,
                                                                               arrParametros[intContador]));
                                    command.Parameters["@" + intContador].NpgsqlDbType = NpgsqlDbType.Timestamp;
                                }
                                break;
                            default:
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador,
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador,
                                                                               arrParametros[intContador]));
                                }
                                break;
                        }
                    }
                }


                command.Connection = trans.MyConn;
                command.Transaction = trans.MyTrans;

                var da = new NpgsqlDataAdapter(command);

                var dtTemp = new DataTable();
                da.Fill(dtTemp);

                command.Connection.Close();
                command.Dispose();
                return dtTemp;
            }
            catch (Exception ex)
            {
                ex.Data.Add("StoredProcedure", nombreSp);
                throw;
            }
        }

        /// <summary>
        ///   Metodo que ejecuta un Procedimiento Almacenado
        /// </summary>
        /// <param name="nombreSp" type="string">
        ///   <para>
        ///     Nombre del Stored procedure
        ///   </para>
        /// </param>
        /// <param name="arrParametros" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los nombres de los parametros
        ///   </para>
        /// </param>
        /// /// <param name="arrParametros" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los parametros
        ///   </para>
        /// </param>
        /// <returns>
        ///   Devuelve un DataTable con el resultado de la consulta
        /// </returns>
        public DataTable ExecStoreProcedureToDataTable(string nombreSp, ArrayList arrNombreParametros,
                                                       ArrayList arrParametros)
        {
            var command = new NpgsqlCommand();
            command.CommandText = nombreSp;
            command.CommandType = CommandType.StoredProcedure;

            try
            {
                for (var intContador = 0; intContador < arrParametros.Count; intContador++)
                {
                    if (arrParametros[intContador] == null)
                    {
                        command.Parameters.Add(new NpgsqlParameter(arrNombreParametros[intContador].ToString(),
                                                                   DBNull.Value));
                    }
                    else
                    {
                        switch (arrParametros[intContador].GetType().ToString())
                        {
                            case "System.Int32":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               arrParametros[intContador]));
                                }
                                break;
                            case "System.Decimal":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               arrParametros[intContador]));
                                }
                                break;
                            case "System.String":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                                               arrParametros[intContador]));
                                    command.Parameters["@" + arrNombreParametros[intContador]].NpgsqlDbType = NpgsqlDbType.Text;
                                }
                                break;
                            case "System.DateTime":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                                               arrParametros[intContador]));
                                    command.Parameters["@" + arrNombreParametros[intContador]].NpgsqlDbType = NpgsqlDbType.Timestamp;
                                }
                                break;
                            default:
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                                               arrParametros[intContador]));
                                }
                                break;
                        }
                    }
                }

                command.Connection = ConexionBd;

                var da = new NpgsqlDataAdapter(command);

                var dtTemp = new DataTable();
                da.Fill(dtTemp);

                command.Connection.Close();
                command.Dispose();
                return dtTemp;
            }
            catch (Exception ex)
            {
                ex.Data.Add("StoredProcedure", nombreSp);
                throw;
            }
        }

        /// <summary>
        ///   Metodo que ejecuta un Procedimiento Almacenado
        /// </summary>
        /// <param name="nombreSp" type="string">
        ///   <para>
        ///     Nombre del Stored procedure
        ///   </para>
        /// </param>
        /// <param name="arrParametros" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los nombres de los parametros
        ///   </para>
        /// </param>
        /// /// <param name="arrParametros" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los parametros
        ///   </para>
        /// </param>
        /// <param name="myTrans" type="Conexion.cTrans">
        ///   <para>
        ///     Objeto que contiene la Transaccion activa utilizada para realizar la operacion
        ///   </para>
        /// </param>
        /// <returns>
        ///   Devuelve un DataTable con el resultado de la consulta
        /// </returns>
        public DataTable ExecStoreProcedureToDataTable(string nombreSp, ArrayList arrNombreParametros,
                                                       ArrayList arrParametros, ref CTrans trans)
        {
            var command = new NpgsqlCommand();
            command.CommandText = nombreSp;
            command.CommandType = CommandType.StoredProcedure;

            try
            {
                if (arrNombreParametros.Count != arrParametros.Count)
                {
                    throw new ArgumentException(
                        "Error al ejecutar procedimiento almacenado. El numero de parametros debe ser igual al número de nombres de parametros.");
                }

                for (var intContador = 0; intContador < arrParametros.Count; intContador++)
                {
                    if (arrParametros[intContador] == null)
                    {
                        command.Parameters.Add(new NpgsqlParameter(arrNombreParametros[intContador].ToString(),
                                                                   DBNull.Value));
                    }
                    else
                    {
                        switch (arrParametros[intContador].GetType().ToString())
                        {
                            case "System.Int32":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               arrParametros[intContador]));
                                }
                                break;
                            case "System.Decimal":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               arrParametros[intContador]));
                                }
                                break;
                            case "System.String":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                                               arrParametros[intContador]));
                                    command.Parameters["@" + arrNombreParametros[intContador]].NpgsqlDbType = NpgsqlDbType.Text;
                                }
                                break;
                            case "System.DateTime":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                                               arrParametros[intContador]));
                                    command.Parameters["@" + arrNombreParametros[intContador]].NpgsqlDbType = NpgsqlDbType.Timestamp;
                                }
                                break;
                            default:
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                                               arrParametros[intContador]));
                                }
                                break;
                        }
                    }
                }
                command.Connection = trans.MyConn;
                command.Transaction = trans.MyTrans;

                var da = new NpgsqlDataAdapter(command);

                var dtTemp = new DataTable();
                da.Fill(dtTemp);

                command.Dispose();
                return dtTemp;
            }
            catch (Exception ex)
            {
                ex.Data.Add("StoredProcedure", nombreSp);
                throw;
            }
        }

        #endregion

        #region Funciones: Ejecutar SPs a un DataReader

        /// <summary>
        ///   Metodo que ejecuta un Procedimiento Almacenado
        /// </summary>
        /// <param name="nombreSp" type="string">
        ///   <para>
        ///     Nombre del Stored procedure
        ///   </para>
        /// </param>
        /// <returns>
        ///   Devuelve un DbDataReader con el resultado de la consulta
        /// </returns>
        public DbDataReader ExecStoreProcedureToDbDataReader(string nombreSp)
        {
            var command = new NpgsqlCommand();
            command.CommandText = nombreSp;
            command.CommandType = CommandType.StoredProcedure;
            try
            {
                command.Connection = ConexionBd;
                if (command.Connection.State == ConnectionState.Closed)
                {
                    command.Connection.Open();
                }
                DbDataReader dr = command.ExecuteReader(CommandBehavior.CloseConnection);
                if (command.Connection.State != ConnectionState.Closed)
                {
                    command.Connection.Close();
                }
                command.Dispose();
                return dr;
            }
            catch (Exception ex)
            {
                ex.Data.Add("StoredProcedure", nombreSp);
                throw;
            }
        }

        /// <summary>
        ///   Metodo que ejecuta un Procedimiento Almacenado
        /// </summary>
        /// <param name="nombreSp" type="string">
        ///   <para>
        ///     Nombre del Stored procedure
        ///   </para>
        /// </param>
        /// <param name="myTrans" type="Conexion.cTrans">
        ///   <para>
        ///     Objeto que contiene la Transaccion activa utilizada para realizar la operacion
        ///   </para>
        /// </param>
        /// <returns>
        ///   Devuelve un DbDataReader con el resultado de la consulta
        /// </returns>
        public DbDataReader ExecStoreProcedureToDbDataReader(string nombreSp, ref CTrans myTrans)
        {
            var command = new NpgsqlCommand();
            command.CommandText = nombreSp;
            command.CommandType = CommandType.StoredProcedure;

            try
            {
                command.Connection = myTrans.MyConn;
                command.Transaction = myTrans.MyTrans;

                if (command.Connection.State == ConnectionState.Closed)
                {
                    command.Connection.Open();
                }
                DbDataReader dr = command.ExecuteReader(CommandBehavior.Default);
                command.Dispose();
                return dr;
            }
            catch (Exception ex)
            {
                ex.Data.Add("StoredProcedure", nombreSp);
                throw;
            }
        }

        /// <summary>
        ///   Metodo que ejecuta un Procedimiento Almacenado
        /// </summary>
        /// <param name="nombreSp" type="string">
        ///   <para>
        ///     Nombre del Stored procedure
        ///   </para>
        /// </param>
        /// <param name="arrParametros" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los parametros
        ///   </para>
        /// </param>
        /// <returns>
        ///   Devuelve un DbDataReader con el resultado de la consulta
        /// </returns>
        public DbDataReader ExecStoreProcedureToDbDataReader(string nombreSp, ArrayList arrParametros)
        {
            var command = new NpgsqlCommand();
            command.CommandText = nombreSp;
            command.CommandType = CommandType.StoredProcedure;

            try
            {
                for (var intContador = 0; intContador < arrParametros.Count; intContador++)
                {
                    if (arrParametros[intContador] == null)
                    {
                        command.Parameters.Add(new NpgsqlParameter(arrParametros[intContador].ToString(), DBNull.Value));
                    }
                    else
                    {
                        switch (arrParametros[intContador].GetType().ToString())
                        {
                            case "System.Int32":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               arrParametros[intContador]));
                                }
                                break;
                            case "System.Decimal":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               arrParametros[intContador]));
                                }
                                break;
                            case "System.String":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador,
                                                                               arrParametros[intContador]));
                                    command.Parameters["@" + intContador].NpgsqlDbType = NpgsqlDbType.Text;
                                }
                                break;
                            case "System.DateTime":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador,
                                                                               arrParametros[intContador]));
                                    command.Parameters["@" + intContador].NpgsqlDbType = NpgsqlDbType.Timestamp;
                                }
                                break;
                            default:
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador,
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador,
                                                                               arrParametros[intContador]));
                                }
                                break;
                        }
                    }
                }

                command.Connection = ConexionBd;

                if (command.Connection.State == ConnectionState.Closed)
                {
                    command.Connection.Open();
                }
                DbDataReader dr = command.ExecuteReader(CommandBehavior.CloseConnection);
                if (command.Connection.State != ConnectionState.Closed)
                {
                    command.Connection.Close();
                }
                command.Dispose();
                return dr;
            }
            catch (Exception ex)
            {
                ex.Data.Add("StoredProcedure", nombreSp);
                throw;
            }
        }

        /// <summary>
        ///   Metodo que ejecuta un Procedimiento Almacenado
        /// </summary>
        /// <param name="nombreSp" type="string">
        ///   <para>
        ///     Nombre del Stored procedure
        ///   </para>
        /// </param>
        /// <param name="arrParametros" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los parametros
        ///   </para>
        /// </param>
        /// <param name="trans" type="Conexion.cTrans">
        ///   <para>
        ///     Objeto que contiene la Transaccion activa utilizada para realizar la operacion
        ///   </para>
        /// </param>
        /// <returns>
        ///   Devuelve un DbDataReader con el resultado de la consulta
        /// </returns>
        public DbDataReader ExecStoreProcedureToDbDataReader(string nombreSp, ArrayList arrParametros, ref CTrans trans)
        {
            var command = new NpgsqlCommand();
            command.CommandText = nombreSp;
            command.CommandType = CommandType.StoredProcedure;

            try
            {
                for (var intContador = 0; intContador < arrParametros.Count; intContador++)
                {
                    if (arrParametros[intContador] == null)
                    {
                        command.Parameters.Add(new NpgsqlParameter(arrParametros[intContador].ToString(), DBNull.Value));
                    }
                    else
                    {
                        switch (arrParametros[intContador].GetType().ToString())
                        {
                            case "System.Int32":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               arrParametros[intContador]));
                                }
                                break;
                            case "System.Decimal":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               arrParametros[intContador]));
                                }
                                break;
                            case "System.String":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador,
                                                                               arrParametros[intContador]));
                                    command.Parameters["@" + intContador].NpgsqlDbType = NpgsqlDbType.Text;
                                }
                                break;
                            case "System.DateTime":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador, DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador,
                                                                               arrParametros[intContador]));
                                    command.Parameters["@" + intContador].NpgsqlDbType = NpgsqlDbType.Timestamp;
                                }
                                break;
                            default:
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador,
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + intContador,
                                                                               arrParametros[intContador]));
                                }
                                break;
                        }
                    }
                }


                command.Connection = trans.MyConn;
                command.Transaction = trans.MyTrans;

                if (command.Connection.State == ConnectionState.Closed)
                {
                    command.Connection.Open();
                }
                DbDataReader dr = command.ExecuteReader(CommandBehavior.Default);
                command.Dispose();
                return dr;
            }
            catch (Exception ex)
            {
                ex.Data.Add("StoredProcedure", nombreSp);
                throw;
            }
        }

        /// <summary>
        ///   Metodo que ejecuta un Procedimiento Almacenado
        /// </summary>
        /// <param name="nombreSp" type="string">
        ///   <para>
        ///     Nombre del Stored procedure
        ///   </para>
        /// </param>
        /// <param name="arrParametros" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los nombres de los parametros
        ///   </para>
        /// </param>
        /// /// <param name="arrParametros" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los parametros
        ///   </para>
        /// </param>
        /// <returns>
        ///   Devuelve un DbDataReader con el resultado de la consulta
        /// </returns>
        public DbDataReader ExecStoreProcedureToDbDataReader(string nombreSp, ArrayList arrNombreParametros,
                                                       ArrayList arrParametros)
        {
            var command = new NpgsqlCommand();
            command.CommandText = nombreSp;
            command.CommandType = CommandType.StoredProcedure;

            try
            {
                for (var intContador = 0; intContador < arrParametros.Count; intContador++)
                {
                    if (arrParametros[intContador] == null)
                    {
                        command.Parameters.Add(new NpgsqlParameter(arrNombreParametros[intContador].ToString(),
                                                                   DBNull.Value));
                    }
                    else
                    {
                        switch (arrParametros[intContador].GetType().ToString())
                        {
                            case "System.Int32":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               arrParametros[intContador]));
                                }
                                break;
                            case "System.Decimal":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               arrParametros[intContador]));
                                }
                                break;
                            case "System.String":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                                               arrParametros[intContador]));
                                    command.Parameters["@" + arrNombreParametros[intContador]].NpgsqlDbType = NpgsqlDbType.Text;
                                }
                                break;
                            case "System.DateTime":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                                               arrParametros[intContador]));
                                    command.Parameters["@" + arrNombreParametros[intContador]].NpgsqlDbType = NpgsqlDbType.Timestamp;
                                }
                                break;
                            default:
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                                               arrParametros[intContador]));
                                }
                                break;
                        }
                    }
                }

                command.Connection = ConexionBd;

                if (command.Connection.State == ConnectionState.Closed)
                {
                    command.Connection.Open();
                }
                DbDataReader dr = command.ExecuteReader(CommandBehavior.CloseConnection);
                if (command.Connection.State != ConnectionState.Closed)
                {
                    command.Connection.Close();
                }
                command.Dispose();
                return dr;
            }
            catch (Exception ex)
            {
                ex.Data.Add("StoredProcedure", nombreSp);
                throw;
            }
        }

        /// <summary>
        ///   Metodo que ejecuta un Procedimiento Almacenado
        /// </summary>
        /// <param name="nombreSp" type="string">
        ///   <para>
        ///     Nombre del Stored procedure
        ///   </para>
        /// </param>
        /// <param name="arrParametros" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los nombres de los parametros
        ///   </para>
        /// </param>
        /// /// <param name="arrParametros" type="System.Collections.ArrayList">
        ///   <para>
        ///     Coleccion de objetos referidad a los parametros
        ///   </para>
        /// </param>
        /// <param name="myTrans" type="Conexion.cTrans">
        ///   <para>
        ///     Objeto que contiene la Transaccion activa utilizada para realizar la operacion
        ///   </para>
        /// </param>
        /// <returns>
        ///   Devuelve un DbDataReader con el resultado de la consulta
        /// </returns>
        public DbDataReader ExecStoreProcedureToDbDataReader(string nombreSp, ArrayList arrNombreParametros,
                                                       ArrayList arrParametros, ref CTrans trans)
        {
            var command = new NpgsqlCommand();
            command.CommandText = nombreSp;
            command.CommandType = CommandType.StoredProcedure;

            try
            {
                if (arrNombreParametros.Count != arrParametros.Count)
                {
                    throw new ArgumentException(
                        "Error al ejecutar procedimiento almacenado. El numero de parametros debe ser igual al número de nombres de parametros.");
                }

                for (var intContador = 0; intContador < arrParametros.Count; intContador++)
                {
                    if (arrParametros[intContador] == null)
                    {
                        command.Parameters.Add(new NpgsqlParameter(arrNombreParametros[intContador].ToString(),
                                                                   DBNull.Value));
                    }
                    else
                    {
                        switch (arrParametros[intContador].GetType().ToString())
                        {
                            case "System.Int32":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               arrParametros[intContador]));
                                }
                                break;
                            case "System.Decimal":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], NpgsqlDbType.Numeric, 4, "",
                                                                               ParameterDirection.Input, false, 0, 0,
                                                                               DataRowVersion.Proposed,
                                                                               arrParametros[intContador]));
                                }
                                break;
                            case "System.String":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                                               arrParametros[intContador]));
                                    command.Parameters["@" + arrNombreParametros[intContador]].NpgsqlDbType = NpgsqlDbType.Text;
                                }
                                break;
                            case "System.DateTime":
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador], DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                                               arrParametros[intContador]));
                                    command.Parameters["@" + arrNombreParametros[intContador]].NpgsqlDbType = NpgsqlDbType.Timestamp;
                                }
                                break;
                            default:
                                if (arrParametros[intContador] == null)
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                                               DBNull.Value));
                                }
                                else
                                {
                                    command.Parameters.Add(new NpgsqlParameter("@" + arrNombreParametros[intContador],
                                                                               arrParametros[intContador]));
                                }
                                break;
                        }
                    }
                }
                command.Connection = trans.MyConn;
                command.Transaction = trans.MyTrans;

                if (command.Connection.State == ConnectionState.Closed)
                {
                    command.Connection.Open();
                }
                DbDataReader dr = command.ExecuteReader(CommandBehavior.Default);
                command.Dispose();
                return dr;
            }
            catch (Exception ex)
            {
                ex.Data.Add("StoredProcedure", nombreSp);
                throw;
            }
        }

        #endregion


        public int EjecutarQuery(string strQuery)
        {
            try
            {
                if (ConexionBd.State == ConnectionState.Closed)
                {
                    ConexionBd.Open();
                }

                var command = new NpgsqlCommand(strQuery, ConexionBd);

                var numReg = command.ExecuteNonQuery();
                command.Dispose();
                ConexionBd.Close();
                return numReg;
            }
            catch (Exception ex)
            {
                ex.Data.Add("Query en updateBD", strQuery);
                throw;
            }
        }
    }
}
