using System.Collections;
using System.Data;
using System.Data.Common;
using ReAl.Lumino.Encuestas.Helpers;

#region

#endregion

namespace ReAl.Lumino.Encuestas.Dal
{
    public class RnVista
    {
        private readonly string _strConn;
        
        public RnVista(string strConn)
        {
            _strConn = strConn;            
        }

        public RnVista(ConnectionStringsSettings strConn)
        {
            _strConn = strConn.DataAccessPostgreSqlProvider;
        }

        /// <summary>
        /// Funcion que carga el resultado de una consulta SELECT de un DataTable
        /// </summary>
        /// <param name="vista">Nombre de la Vista</param>
        /// <returns>DataTable con el resultado de las consultas</returns>
        public DataTable ObtenerDatos(string vista)
        {
            var arrColumnasWhere = new ArrayList {"'1'"};
            var arrValoresWhere = new ArrayList {"'1'"};

            var arrColumnas = new ArrayList {"*"};

            var local = new CConn(_strConn);
            var table = local.cargarDataTableAnd(vista, arrColumnas, arrColumnasWhere, arrValoresWhere);

            return table;
        }

        /// <summary>
        /// Funcion que carga el resultado de una consulta SELECT de una vista a un DataTable
        /// </summary>
        /// <param name="vista">Nombre de la Vista</param>
        /// <param name="arrColumnas">Array de Columnas  seleccionadas en la Vista</param>
        /// <returns>DataTable con el resultado de la consulta</returns>
        public DataTable ObtenerDatos(string vista, ArrayList arrColumnas)
        {
            var arrColumnasWhere = new ArrayList {"'1'"};
            var arrValoresWhere = new ArrayList {"'1'"};

            var local = new CConn(_strConn);
            var table = local.cargarDataTableAnd(vista, arrColumnas, arrColumnasWhere, arrValoresWhere);

            return table;
        }

        /// <summary>
        /// Funcion que carga el resultado de una consulta SELECT de una vista a un DataTable
        /// </summary>
        /// <param name="vista">Nombre de la Vista</param>
        /// <param name="arrColumnas">Array de Columnas  seleccionadas en la Vista</param>
        /// <param name="strParametrosAdicionales">Parametros adicionales</param>
        /// <returns>DataTable con el resultado de la consulta</returns>
        public DataTable ObtenerDatos(string vista, ArrayList arrColumnas, string strParametrosAdicionales)
        {
            var arrColumnasWhere = new ArrayList {"'1'"};
            var arrValoresWhere = new ArrayList {"'1'"};

            var local = new CConn(_strConn);
            var table = local.cargarDataTableAnd(vista, arrColumnas, arrColumnasWhere, arrValoresWhere, strParametrosAdicionales);

            return table;
        }

        /// <summary>
        /// Funcion que carga el resultado de una consulta SELECT de una vista a un DataTable a partir de columnas filtradas
        /// </summary>
        /// <param name="vista">Nombre de la Vista</param>
        /// <param name="arrColumnasWhere">Nombre de las columnas por las que se va a filtrar el resultado</param>
        /// <param name="arrValoresWhere">Valor para cada una de las columnas con las que se va a filtrar el resultado</param>
        /// <returns>DatatTable con el resultado de la consulta</returns>
        public DataTable ObtenerDatos(string vista, ArrayList arrColumnasWhere, ArrayList arrValoresWhere)
        {
            var arrColumnas = new ArrayList {"*"};

            var local = new CConn(_strConn);
            var table = local.cargarDataTableAnd(vista, arrColumnas, arrColumnasWhere, arrValoresWhere);

            return table;            
        }

        public DataTable ObtenerDatos(string vista, Hashtable htbFiltro)
        {
            return ObtenerDatos(vista, htbFiltro, "");
        }
        
        public DataTable ObtenerDatos(string vista, Hashtable htbFiltro, string strParametrosAdicionales)
        {
            var arrColumnasWhere = new ArrayList();
            var arrValoresWhere =new ArrayList();

            foreach (DictionaryEntry entry in htbFiltro)
            {
                arrColumnasWhere.Add(entry.Key.ToString());
                arrValoresWhere.Add(entry.Value.ToString());
            }
            
            return ObtenerDatos(vista, arrColumnasWhere, arrValoresWhere, strParametrosAdicionales);
        }


        /// <summary>
        /// Funcion que carga el resultado de una consulta SELECT de determinadas columnas de una vista a un DataTable a partir de columnas filtradas
        /// </summary>
        /// <param name="vista">Nombre de la Vista</param>
        /// <param name="arrColumnas">Array de columnas seleccionadas de la Vista</param>
        /// <param name="arrColumnasWhere">Nombre de las columnas por las que se va a filtrar el resultado</param>
        /// <param name="arrValoresWhere">Valor para cada una de las columnas con las que se va a filtrar el resultado</param>
        /// <param name="strParametrosAdicionales">Condiciones adicionales concatenadas al final de la consulta</param>
        /// <returns>DataTable con el resultado de la consulta</returns>
        public DataTable ObtenerDatos(string vista, ArrayList arrColumnas, ArrayList arrColumnasWhere,
                                      ArrayList arrValoresWhere, string strParametrosAdicionales)
        {            
            var local = new CConn(_strConn);

            var table = local.cargarDataTableAnd(vista, arrColumnas, arrColumnasWhere, arrValoresWhere,
                strParametrosAdicionales);

            return table;
        }

        public DataTable ObtenerDatosLike(string vista, ArrayList arrColumnas, ArrayList arrColumnasWhere, ArrayList arrValoresWhere, string strParametrosAdicionales)
        {
            var local = new CConn(_strConn);

            var table = local.cargarDataTableLike(vista, arrColumnas, arrColumnasWhere, arrValoresWhere,
                strParametrosAdicionales);

            return table;
        }

        /// <summary>
        /// Funcion que carga el resultado de una consulta SELECT de determinadas columnas de una vista a un DataTable a partir de columnas filtradas
        /// </summary>
        /// <param name="vista">Nombre de la Vista</param>
        /// <param name="arrColumnas">Array de columnas seleccionadas de la Vista</param>
        /// <param name="arrColumnasWhere">Nombre de las columnas por las que se va a filtrar el resultado</param>
        /// <param name="arrValoresWhere">Valor para cada una de las columnas con las que se va a filtrar el resultado</param>
        /// <returns>DataTable con el resultado de la consulta</returns>
        public DataTable ObtenerDatos(string vista, ArrayList arrColumnas, ArrayList arrColumnasWhere,
                                      ArrayList arrValoresWhere)
        {
            var local = new CConn(_strConn);
            var table = local.cargarDataTableAnd(vista, arrColumnas, arrColumnasWhere, arrValoresWhere);
            return table;
        }

        
        /// <summary>
        /// Funcion que carga el resultado de una consulta SELECT de una vista a un DataTable a partir de columnas filtradas
        /// </summary>
        /// <param name="vista">Nombre de la Vista</param>
        /// <param name="arrColumnasWhere">Nombre de las columnas por las que se va a filtrar el resultado</param>
        /// <param name="arrValoresWhere">Valor para cada una de las columnas con las que se va a filtrar el resultado</param>
        /// <param name="strParametrosAdicionales">Condiciones adicionales concatenadas al final de la consulta</param>
        /// <returns>DataTable con el resultado de la Consulta</returns>
        public DataTable ObtenerDatos(string vista, ArrayList arrColumnasWhere, ArrayList arrValoresWhere,
                                      string strParametrosAdicionales)
        {
            var arrColumnas = new ArrayList {"*"};

            var local = new CConn(_strConn);
            var table = local.cargarDataTableAnd(vista, arrColumnas, arrColumnasWhere, arrValoresWhere,
                strParametrosAdicionales);
            
            return table;
        }

        public DbDataReader ObtenerDataReader(string vista, ArrayList arrColumnasWhere, ArrayList arrValoresWhere,
            string strParametrosAdicionales)
        {
            var arrColumnas = new ArrayList {"*"};

            var local = new CConn(_strConn);
            var table = local.cargarDataReaderAnd(vista, arrColumnas, arrColumnasWhere, arrValoresWhere,
                strParametrosAdicionales);
            return table;
        }

        /// <summary>
        /// Funcion que carga el resultado de una consulta SELECT de una vista a un DataTable a partir de un filtro escrito manualmente
        /// </summary>
        /// <param name="vista">Nombre de la Vista</param>
        /// <param name="condicionesWhere">Condiciones adicionales concatenadas al final de la consulta</param>
        /// <returns>DataTable con el resultado de la Consulta</returns>
        public DataTable ObtenerDatos(string vista, string condicionesWhere)
        {
            var arrColumnas = new ArrayList {"*"};

            var arrColumnasWhere = new ArrayList {"'1'"};
            var arrValoresWhere = new ArrayList {"'1'"};

            var local = new CConn(_strConn);
            var table = local.cargarDataTableOr(vista, arrColumnas, arrColumnasWhere, arrValoresWhere,
                " AND (" + condicionesWhere + ")");

            return table;
        }        

        /// <summary>
        /// Funcion que carga el resultado de una consulta SELECT de una vista a un DataTable a partir de columnas filtradas (Condiciones OR)
        /// </summary>
        /// <param name="vista">Nombre de la Vista</param>
        /// <param name="arrColumnasWhere">Nombre de las columnas por las que se va a filtrar el resultado</param>
        /// <param name="arrValoresWhere">Valor para cada una de las columnas con las que se va a filtrar el resultado</param>
        /// <returns>DataTable con el resultado de la consulta</returns>
        public DataTable ObtenerDatosOr(string vista, ArrayList arrColumnasWhere, ArrayList arrValoresWhere)
        {
            var arrColumnas = new ArrayList {"*"};

            var local = new CConn(_strConn);
            var table = local.cargarDataTableOr(vista, arrColumnas, arrColumnasWhere, arrValoresWhere);

            return table;
        }

        /// <summary>
        /// Funcion que carga el resultado de una consulta SELECT de determinadas columnas de una vista a un DataTable a partir de columnas filtradas (Condiciones OR)
        /// </summary>
        /// <param name="vista">Nombre de la Vista</param>
        /// <param name="arrColumnas">Nombre de las columnas seleccionadas</param>
        /// <param name="arrColumnasWhere">Nombre de las columnas por las que se va a filtrar el resultado</param>
        /// <param name="arrValoresWhere">Valor para cada una de las columnas con las que se va a filtrar el resultado</param>
        /// <param name="strParametrosAdicionales"></param>
        /// <returns>DataTable con el resultado de la consulta</returns>
        public DataTable ObtenerDatosOr(string vista, ArrayList arrColumnas, ArrayList arrColumnasWhere,
                                        ArrayList arrValoresWhere, string strParametrosAdicionales)
        {
            var local = new CConn(_strConn);

            var table = local.cargarDataTableOr(vista, arrColumnas, arrColumnasWhere, arrValoresWhere,
                strParametrosAdicionales);

            return table;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="vista"></param>
        /// <param name="arrColumnasWhere"></param>
        /// <param name="arrValoresWhere"></param>
        /// <param name="strParametrosAdicionales"></param>
        /// <returns></returns>
        public DataTable ObtenerDatosOr(string vista, ArrayList arrColumnasWhere, ArrayList arrValoresWhere,
                                        string strParametrosAdicionales)
        {
            var arrColumnas = new ArrayList {"*"};

            var local = new CConn(_strConn);
            var table = local.cargarDataTableOr(vista, arrColumnas, arrColumnasWhere, arrValoresWhere,
                strParametrosAdicionales);

            return table;
        }
        
        /// <summary>
        /// 
        /// </summary>
        /// <param name="nombreProcAlm"></param>
        /// <param name="arrParametros"></param>
        /// <returns></returns>
        public DataTable ObtenerDatosProcAlm(string nombreProcAlm, ArrayList arrParametros)
        {
            var local = new CConn(_strConn);
            var table = local.execStoreProcedureToDataTable(nombreProcAlm, arrParametros);

            return table;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="nombreProcAlm"></param>
        /// <returns></returns>
        public DataTable ObtenerDatosProcAlm(string nombreProcAlm)
        {
            var local = new CConn(_strConn);
            var table = local.execStoreProcedureToDataTable(nombreProcAlm);

            return table;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="nombreProcAlm"></param>
        /// <param name="arrNombreParametros"></param>
        /// <param name="arrParametros"></param>
        /// <returns></returns>
        public DataTable ObtenerDatosProcAlm(string nombreProcAlm, ArrayList arrNombreParametros, ArrayList arrParametros)
        {
            var local = new CConn(_strConn);
            var table = local.execStoreProcedureToDataTable(nombreProcAlm, arrNombreParametros, arrParametros);

            return table;
        }

        /// <summary>
        /// </summary>
        /// <param name="nombreProcAlm"></param>
        /// <param name="arrNombreParametros"></param>
        /// <param name="arrParametros"></param>
        /// <param name="myTrans"></param>
        /// <returns></returns>
        public DataTable ObtenerDatosProcAlm(string nombreProcAlm, ArrayList arrNombreParametros, ArrayList arrParametros, ref CTrans myTrans)
        {
            var local = new CConn(_strConn);
            var table = local.execStoreProcedureToDataTable(nombreProcAlm, arrNombreParametros, arrParametros, ref myTrans);

            return table;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="nombreProcAlm"></param>                
        /// <returns></returns>
        public int EjecutarProcAlm(string nombreProcAlm)
        {
            var local = new CConn(_strConn);
            var iTotal = local.execStoreProcedure(nombreProcAlm) ? 1 : 0;
            return iTotal;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="nombreProcAlm"></param>        
        /// <param name="arrParametros"></param>
        /// <returns></returns>
        public int EjecutarProcAlm(string nombreProcAlm, ArrayList arrParametros)
        {
            var local = new CConn(_strConn);
            var iTotal = local.execStoreProcedure(nombreProcAlm, arrParametros) ? 1 : 0;
            return iTotal;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="nombreProcAlm"></param>
        /// <param name="arrNombreParametros"></param>
        /// <param name="arrParametros"></param>
        /// <returns></returns>
        public int EjecutarProcAlm(string nombreProcAlm, ArrayList arrNombreParametros, ArrayList arrParametros)
        {
            var local = new CConn(_strConn);
            var iTotal = local.execStoreProcedure(nombreProcAlm, arrNombreParametros, arrParametros);
            return iTotal;
        }

        /// <summary>
        /// </summary>
        /// <param name="nombreProcAlm"></param>
        /// <param name="arrNombreParametros"></param>
        /// <param name="arrParametros"></param>
        /// <param name="myTrans"></param>
        /// <returns></returns>
        public int EjecutarProcAlm(string nombreProcAlm, ArrayList arrNombreParametros, ArrayList arrParametros, ref CTrans myTrans)
        {
            var local = new CConn(_strConn);
            var iTotal = local.execStoreProcedure(nombreProcAlm, arrNombreParametros, arrParametros, ref myTrans);
            return iTotal;
        }
    }
}
