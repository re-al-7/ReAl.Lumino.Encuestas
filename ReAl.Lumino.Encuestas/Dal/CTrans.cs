#region

using System;
using System.Data;
using Npgsql;

#endregion


namespace ReAl.Lumino.Encuestas.Dal
{
    public class CTrans
    {
        internal NpgsqlTransaction MyTrans;
        internal NpgsqlConnection MyConn;

        /// <summary>
        ///     Constructor, que además abre la conexion y la transaccion
        /// </summary>
        public CTrans(string strConn)
        {
            CConn tempConnWebService = new CConn(strConn);
            MyConn = tempConnWebService.ConexionBd;
            MyConn.Open();
            MyTrans = MyConn.BeginTransaction();
        }

        /// <summary>
        ///     Commit transaccion y cerrar conexion
        /// </summary>
        public void ConfirmarTransaccion()
        {
            try
            {
                MyTrans.Commit();
            }
            catch (Exception)
            {
                MyTrans.Rollback();
                if (MyConn.State == ConnectionState.Open)
                {
                    MyConn.Close();
                }
                throw;
            }
        }

        /// <summary>
        ///     RollBack transaccion y cerrar conexion
        /// </summary>
        public void AnularTransaccion()
        {
            try
            {
                MyTrans.Rollback();
                MyConn.Close();
            }
            catch (Exception)
            {
                MyTrans.Rollback();
                if (MyConn.State == ConnectionState.Open)
                {
                    MyConn.Close();
                }
                throw;
            }
        }
    }
}