using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace ReAl.Lumino.Encuestas.Models
{
    public partial class db_encuestasContext : DbContext
    {
        public virtual DbSet<CatDepartamentos> CatDepartamentos { get; set; }
        public virtual DbSet<CatNiveles> CatNiveles { get; set; }
        public virtual DbSet<CatTiposPregunta> CatTiposPregunta { get; set; }
        public virtual DbSet<EncEncuestas> EncEncuestas { get; set; }
        public virtual DbSet<EncFlujos> EncFlujos { get; set; }
        public virtual DbSet<EncInformantes> EncInformantes { get; set; }
        public virtual DbSet<EncPreguntas> EncPreguntas { get; set; }
        public virtual DbSet<EncRespuestas> EncRespuestas { get; set; }
        public virtual DbSet<EncSecciones> EncSecciones { get; set; }
        public virtual DbSet<OpeBrigadas> OpeBrigadas { get; set; }
        public virtual DbSet<OpeMovimientos> OpeMovimientos { get; set; }
        public virtual DbSet<OpeProyectos> OpeProyectos { get; set; }
        public virtual DbSet<OpeUpms> OpeUpms { get; set; }
        public virtual DbSet<SegAplicaciones> SegAplicaciones { get; set; }
        public virtual DbSet<SegConfiguracion> SegConfiguracion { get; set; }
        public virtual DbSet<SegEstados> SegEstados { get; set; }
        public virtual DbSet<SegGlosas> SegGlosas { get; set; }
        public virtual DbSet<SegMensajes> SegMensajes { get; set; }
        public virtual DbSet<SegPaginas> SegPaginas { get; set; }
        public virtual DbSet<SegRoles> SegRoles { get; set; }
        public virtual DbSet<SegRolesPagina> SegRolesPagina { get; set; }
        public virtual DbSet<SegRolesTablaTransaccion> SegRolesTablaTransaccion { get; set; }
        public virtual DbSet<SegTablas> SegTablas { get; set; }
        public virtual DbSet<SegTransacciones> SegTransacciones { get; set; }
        public virtual DbSet<SegTransiciones> SegTransiciones { get; set; }
        public virtual DbSet<SegUsuarios> SegUsuarios { get; set; }
        public virtual DbSet<SegUsuariosRestriccion> SegUsuariosRestriccion { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseNpgsql(@"Host=localhost;Database=db_encuestas;Username=postgres;Password=Desa2016");
            }
            optionsBuilder.EnableSensitiveDataLogging();
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<CatDepartamentos>(entity =>
            {
                entity.ForNpgsqlHasComment("Contiene el identificador geografíco de departamentos");

                entity.Property(e => e.Idcde)
                    .HasDefaultValueSql("nextval(('public.cat_cde_seq'::text)::regclass)")
                    .ForNpgsqlHasComment("Llave primaria del identificador del departamento");

                entity.Property(e => e.Abreviatura).ForNpgsqlHasComment("Abreviatura del Departamento");

                entity.Property(e => e.Apiestado)
                    .HasDefaultValueSql("'ELABORADO'::character varying")
                    .ForNpgsqlHasComment("Estado en el que se encuentra el registro");

                entity.Property(e => e.Apitransaccion)
                    .HasDefaultValueSql("'CREAR'::character varying")
                    .ForNpgsqlHasComment("Ultima transacción realizada en el registro");

                entity.Property(e => e.Codigo).ForNpgsqlHasComment("Codigo de departamento");

                entity.Property(e => e.Feccre)
                    .HasDefaultValueSql("now()")
                    .ForNpgsqlHasComment("Fecha de creacion del registro");

                entity.Property(e => e.Fecmod).ForNpgsqlHasComment("Fecha en la que se ha realizado la ULTIMA modificacion registro");

                entity.Property(e => e.Latitud).ForNpgsqlHasComment("Latitud del punto CERO de la Capital de Departamento");

                entity.Property(e => e.Longitud).ForNpgsqlHasComment("Longitud del punto CERO de la Capital de Departamento");

                entity.Property(e => e.Nombre).ForNpgsqlHasComment("Nombre del Departamento");

                entity.Property(e => e.Usucre)
                    .HasDefaultValueSql("\"current_user\"()")
                    .ForNpgsqlHasComment("Login o nombre de usuario que ha creado el registro");

                entity.Property(e => e.Usumod).ForNpgsqlHasComment("Login o nombre de usuario que ha realizado la ULTIMA modificacion registro");
            });

            modelBuilder.Entity<CatNiveles>(entity =>
            {
                entity.ForNpgsqlHasComment("Registro de los niveles para las encuestas");

                entity.Property(e => e.Idcnv)
                    .HasDefaultValueSql("nextval(('public.cat_cnv_seq'::text)::regclass)")
                    .ForNpgsqlHasComment("Es el identificador unico que representa al registro en la tabla");

                entity.Property(e => e.Apiestado)
                    .HasDefaultValueSql("'ELABORADO'::character varying")
                    .ForNpgsqlHasComment("Estado en el que se encuentra el registro");

                entity.Property(e => e.Apitransaccion)
                    .HasDefaultValueSql("'CREAR'::character varying")
                    .ForNpgsqlHasComment("Ultima transacción realizada en el registro");

                entity.Property(e => e.Descripcion).ForNpgsqlHasComment("Es la descripcion del Nivel");

                entity.Property(e => e.Feccre)
                    .HasDefaultValueSql("now()")
                    .ForNpgsqlHasComment("Fecha de creacion del registro");

                entity.Property(e => e.Fecmod).ForNpgsqlHasComment("Fecha en la que se ha realizado la ULTIMA modificacion registro");

                entity.Property(e => e.Nivel).ForNpgsqlHasComment("Es el numero de Nivel");

                entity.Property(e => e.Usucre)
                    .HasDefaultValueSql("\"current_user\"()")
                    .ForNpgsqlHasComment("Login o nombre de usuario que ha creado el registro");

                entity.Property(e => e.Usumod).ForNpgsqlHasComment("Login o nombre de usuario que ha realizado la ULTIMA modificacion registro");
            });

            modelBuilder.Entity<CatTiposPregunta>(entity =>
            {
                entity.ForNpgsqlHasComment("Registro de los posibles tipos de Pregunta");

                entity.Property(e => e.Idctp)
                    .HasDefaultValueSql("nextval(('public.cat_ctp_seq'::text)::regclass)")
                    .ForNpgsqlHasComment("Es el identificador unico que representa al registro en la tabla");

                entity.Property(e => e.Apiestado)
                    .HasDefaultValueSql("'ELABORADO'::character varying")
                    .ForNpgsqlHasComment("Estado en el que se encuentra el registro");

                entity.Property(e => e.Apitransaccion)
                    .HasDefaultValueSql("'CREAR'::character varying")
                    .ForNpgsqlHasComment("Ultima transacción realizada en el registro");

                entity.Property(e => e.Descripcion).ForNpgsqlHasComment("Es la descripcion del tipo de pregunta");

                entity.Property(e => e.ExportarCodigo).HasDefaultValueSql("0");

                entity.Property(e => e.Feccre)
                    .HasDefaultValueSql("now()")
                    .ForNpgsqlHasComment("Fecha de creacion del registro");

                entity.Property(e => e.Fecmod).ForNpgsqlHasComment("Fecha en la que se ha realizado la ULTIMA modificacion registro");

                entity.Property(e => e.RespuestaValor).ForNpgsqlHasComment("Es el tipo predominante para la evaluacion del salto en la pregunta. Puede ser RESPUESTA o CODIGO");

                entity.Property(e => e.TipoPregunta).ForNpgsqlHasComment("Es el tipo de pregunta UNICO");

                entity.Property(e => e.Usucre)
                    .HasDefaultValueSql("\"current_user\"()")
                    .ForNpgsqlHasComment("Login o nombre de usuario que ha creado el registro");

                entity.Property(e => e.Usumod).ForNpgsqlHasComment("Login o nombre de usuario que ha realizado la ULTIMA modificacion registro");
            });

            modelBuilder.Entity<EncEncuestas>(entity =>
            {
                entity.ForNpgsqlHasComment("Almacena los datos recolectados en cada nivel");

                entity.Property(e => e.Idenc)
                    .HasDefaultValueSql("nextval(('public.enc_enc_seq'::text)::regclass)")
                    .ForNpgsqlHasComment("Identificador unico que representa al registro en la tabla");

                entity.Property(e => e.Apiestado)
                    .HasDefaultValueSql("'ELABORADO'::character varying")
                    .ForNpgsqlHasComment("Estado en el que se encuentra el registro");

                entity.Property(e => e.Apitransaccion)
                    .HasDefaultValueSql("'CREAR'::character varying")
                    .ForNpgsqlHasComment("Ultima transacción realizada en el registro");

                entity.Property(e => e.CodigoRespuesta)
                    .HasDefaultValueSql("''::text")
                    .ForNpgsqlHasComment("Es el Codigo utilizado por la respuesta, segun la tabla enc_respuesta");

                entity.Property(e => e.Feccre)
                    .HasDefaultValueSql("now()")
                    .ForNpgsqlHasComment("Fecha de creacion del registro");

                entity.Property(e => e.Fecmod).ForNpgsqlHasComment("Fecha en la que se ha realizado la ULTIMA modificacion registro");

                entity.Property(e => e.Fila).HasDefaultValueSql("1");

                entity.Property(e => e.IdLast)
                    .HasDefaultValueSql("(-1)")
                    .ForNpgsqlHasComment("Es el identificador para control de ediciones");

                entity.Property(e => e.Idein).ForNpgsqlHasComment("Es el identificador unico de la tabla enc_informante");

                entity.Property(e => e.IdencTab).ForNpgsqlHasComment("Identificador unico que representa al registro en la tabla en el Dispositivo");

                entity.Property(e => e.Idepr).ForNpgsqlHasComment("Es el identificador unico de la tabla enc_pregunta");

                entity.Property(e => e.Idere).ForNpgsqlHasComment("Es el identificador unico de la tabla enc_respuesta");

                entity.Property(e => e.Idomv).ForNpgsqlHasComment("Es el identificador unico de la tabla enc_movimiento");

                entity.Property(e => e.Latitud)
                    .HasDefaultValueSql("0")
                    .ForNpgsqlHasComment("Latitud del punto CERO de la Capital de Departamento");

                entity.Property(e => e.Longitud)
                    .HasDefaultValueSql("0")
                    .ForNpgsqlHasComment("Longitud del punto CERO de la Capital de Departamento");

                entity.Property(e => e.Observacion).ForNpgsqlHasComment("Representa alguna observacion sobre la respuesta o pregunta");

                entity.Property(e => e.Respuesta).ForNpgsqlHasComment("Es la respuesta TEXTUAL a la pregunta");

                entity.Property(e => e.Usucre)
                    .HasDefaultValueSql("\"current_user\"()")
                    .ForNpgsqlHasComment("Login o nombre de usuario que ha creado el registro");

                entity.Property(e => e.Usumod).ForNpgsqlHasComment("Login o nombre de usuario que ha realizado la ULTIMA modificacion registro");

                entity.HasOne(d => d.IdeinNavigation)
                    .WithMany(p => p.EncEncuestas)
                    .HasForeignKey(d => d.Idein)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_enc_ein");

                entity.HasOne(d => d.IdeprNavigation)
                    .WithMany(p => p.EncEncuestas)
                    .HasForeignKey(d => d.Idepr)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_enc_epr");

                entity.HasOne(d => d.IdomvNavigation)
                    .WithMany(p => p.EncEncuestas)
                    .HasForeignKey(d => d.Idomv)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_enc_omv");
            });

            modelBuilder.Entity<EncFlujos>(entity =>
            {
                entity.ForNpgsqlHasComment("Almacena la secuencia de preguntas o el flujo que deben seguir las preguntas en una encuesta");

                entity.Property(e => e.Idefl)
                    .HasDefaultValueSql("nextval(('public.ope_efl_seq'::text)::regclass)")
                    .ForNpgsqlHasComment("Identificador unico que representa al registro en la tabla");

                entity.Property(e => e.Apiestado)
                    .HasDefaultValueSql("'ELABORADO'::character varying")
                    .ForNpgsqlHasComment("Estado en el que se encuentra el registro");

                entity.Property(e => e.Apitransaccion)
                    .HasDefaultValueSql("'CREAR'::character varying")
                    .ForNpgsqlHasComment("Ultima transacción realizada en el registro");

                entity.Property(e => e.Feccre)
                    .HasDefaultValueSql("now()")
                    .ForNpgsqlHasComment("Fecha de creacion del registro");

                entity.Property(e => e.Fecmod).ForNpgsqlHasComment("Fecha en la que se ha realizado la ULTIMA modificacion registro");

                entity.Property(e => e.Idepr).ForNpgsqlHasComment("Almacena el Id de pregunta origen");

                entity.Property(e => e.IdeprDestino).ForNpgsqlHasComment("Almacena el Id de pregunta destino. -1 representa FIN DE NIVEL. -2 representa FIN DE ENTREVISTA");

                entity.Property(e => e.Idopy).ForNpgsqlHasComment("Identificador del proyecto al que pertenece el registro");

                entity.Property(e => e.Orden)
                    .HasDefaultValueSql("1")
                    .ForNpgsqlHasComment("Es el orden de PRIORIDAD en el que va ha evuarse el flujo");

                entity.Property(e => e.Regla)
                    .HasDefaultValueSql("''::text")
                    .ForNpgsqlHasComment("Es la regla de evaluación para consistencia aplicado a la pregunta");

                entity.Property(e => e.Rpn)
                    .HasDefaultValueSql("''::text")
                    .ForNpgsqlHasComment("Por sus siglas en ingles (Reverse Polish Notation), es la notacion polaca inversa que se genera automaticamente a partir del campo regla");

                entity.Property(e => e.Usucre)
                    .HasDefaultValueSql("\"current_user\"()")
                    .ForNpgsqlHasComment("Login o nombre de usuario que ha creado el registro");

                entity.Property(e => e.Usumod).ForNpgsqlHasComment("Login o nombre de usuario que ha realizado la ULTIMA modificacion registro");

                entity.HasOne(d => d.IdeprNavigation)
                    .WithMany(p => p.EncFlujos)
                    .HasForeignKey(d => d.Idepr)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_efl_epr");

                entity.HasOne(d => d.IdopyNavigation)
                    .WithMany(p => p.EncFlujos)
                    .HasForeignKey(d => d.Idopy)
                    .HasConstraintName("fk_efl_opy");
            });

            modelBuilder.Entity<EncInformantes>(entity =>
            {
                entity.ForNpgsqlHasComment("Almacena los datos padre de cada nivel");

                entity.Property(e => e.Idein)
                    .HasDefaultValueSql("nextval(('public.enc_ein_seq'::text)::regclass)")
                    .ForNpgsqlHasComment("Identificador unico que representa al registro en la tabla");

                entity.Property(e => e.Apiestado)
                    .HasDefaultValueSql("'ELABORADO'::character varying")
                    .ForNpgsqlHasComment("Estado en el que se encuentra el registro");

                entity.Property(e => e.Apitransaccion)
                    .HasDefaultValueSql("'CREAR'::character varying")
                    .ForNpgsqlHasComment("Ultima transacción realizada en el registro");

                entity.Property(e => e.Codigo).ForNpgsqlHasComment("Codigo del informante");

                entity.Property(e => e.Descripcion).ForNpgsqlHasComment("Descripcion del informante");

                entity.Property(e => e.Feccre)
                    .HasDefaultValueSql("now()")
                    .ForNpgsqlHasComment("Fecha de creacion del registro");

                entity.Property(e => e.Fecmod).ForNpgsqlHasComment("Fecha en la que se ha realizado la ULTIMA modificacion registro");

                entity.Property(e => e.Idcnv).ForNpgsqlHasComment("Es el identificador unico de la tabla enc_nivel");

                entity.Property(e => e.IdeinPadre).ForNpgsqlHasComment("Identificador que representa al registro padre en la misma tabla");

                entity.Property(e => e.IdeinTab).ForNpgsqlHasComment("Identificador unico que representa al registro en la tabla en el Dispositivo");

                entity.Property(e => e.IdeinTabPadre).ForNpgsqlHasComment("Identificador que representa al registro padre en la misma tabla en el Dispositivo");

                entity.Property(e => e.Idomv).ForNpgsqlHasComment("Es el identificador unico de la tabla enc_movimiento");

                entity.Property(e => e.Idoup).ForNpgsqlHasComment("Es el identificador unico de la tabla ope_upms en caso de cambio de UPM");

                entity.Property(e => e.Latitud)
                    .HasDefaultValueSql("0")
                    .ForNpgsqlHasComment("Latitud del punto CERO de la Capital de Departamento");

                entity.Property(e => e.Longitud)
                    .HasDefaultValueSql("0")
                    .ForNpgsqlHasComment("Longitud del punto CERO de la Capital de Departamento");

                entity.Property(e => e.Usucre)
                    .HasDefaultValueSql("\"current_user\"()")
                    .ForNpgsqlHasComment("Login o nombre de usuario que ha creado el registro");

                entity.Property(e => e.Usumod).ForNpgsqlHasComment("Login o nombre de usuario que ha realizado la ULTIMA modificacion registro");

                entity.HasOne(d => d.IdcnvNavigation)
                    .WithMany(p => p.EncInformantes)
                    .HasForeignKey(d => d.Idcnv)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_ein_cnv");

                entity.HasOne(d => d.IdomvNavigation)
                    .WithMany(p => p.EncInformantes)
                    .HasForeignKey(d => d.Idomv)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_ein_omv");
            });

            modelBuilder.Entity<EncPreguntas>(entity =>
            {
                entity.HasIndex(e => new { e.Idopy, e.Codigo })
                    .HasName("uk_epr_codigo")
                    .IsUnique();

                entity.Property(e => e.Idepr).HasDefaultValueSql("nextval(('public.enc_epr_seq'::text)::regclass)");

                entity.Property(e => e.Apiestado)
                    .HasDefaultValueSql("'ELABORADO'::character varying")
                    .ForNpgsqlHasComment("Estado en el que se encuentra el registro");

                entity.Property(e => e.Apitransaccion)
                    .HasDefaultValueSql("'CREAR'::character varying")
                    .ForNpgsqlHasComment("Ultima transacción realizada en el registro");

                entity.Property(e => e.Ayuda).HasDefaultValueSql("'--'::text");

                entity.Property(e => e.Bucle)
                    .HasDefaultValueSql("0")
                    .ForNpgsqlHasComment("Indica si esta pregunta es un FIN DE BUCLE (1) o No (0)");

                entity.Property(e => e.Catalogo).HasDefaultValueSql("'--'::character varying");

                entity.Property(e => e.CodigoEspecial).HasDefaultValueSql("0");

                entity.Property(e => e.CodigoEspecifique).HasDefaultValueSql("0");

                entity.Property(e => e.Feccre)
                    .HasDefaultValueSql("now()")
                    .ForNpgsqlHasComment("Fecha de creacion del registro");

                entity.Property(e => e.Fecmod).ForNpgsqlHasComment("Fecha en la que se ha realizado la ULTIMA modificacion registro");

                entity.Property(e => e.Formula).HasDefaultValueSql("''::text");

                entity.Property(e => e.Instruccion)
                    .HasDefaultValueSql("''::text")
                    .ForNpgsqlHasComment("En caso de ser necesario una instruccion en PopUp");

                entity.Property(e => e.Maximo).HasDefaultValueSql("0");

                entity.Property(e => e.Mensaje).HasDefaultValueSql("''::text");

                entity.Property(e => e.Minimo).HasDefaultValueSql("0");

                entity.Property(e => e.MostrarVentana).HasDefaultValueSql("0");

                entity.Property(e => e.Regla).HasDefaultValueSql("''::text");

                entity.Property(e => e.Revision).HasDefaultValueSql("''::text");

                entity.Property(e => e.Rpn).HasDefaultValueSql("''::text");

                entity.Property(e => e.RpnFormula).HasDefaultValueSql("''::text");

                entity.Property(e => e.Usucre)
                    .HasDefaultValueSql("\"current_user\"()")
                    .ForNpgsqlHasComment("Login o nombre de usuario que ha creado el registro");

                entity.Property(e => e.Usumod).ForNpgsqlHasComment("Login o nombre de usuario que ha realizado la ULTIMA modificacion registro");

                entity.Property(e => e.Variable).HasDefaultValueSql("''::text");

                entity.Property(e => e.VariableBucle)
                    .HasDefaultValueSql("''::character varying")
                    .ForNpgsqlHasComment("Necesario para las preguntas del Tipo BUCLE, en cuyo caso, se usara este campo para indicar las posibles respuestas");

                entity.HasOne(d => d.IdcnvNavigation)
                    .WithMany(p => p.EncPreguntas)
                    .HasForeignKey(d => d.Idcnv)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_epr_cnv");

                entity.HasOne(d => d.IdctpNavigation)
                    .WithMany(p => p.EncPreguntas)
                    .HasForeignKey(d => d.Idctp)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_epr_ctp");

                entity.HasOne(d => d.IdeseNavigation)
                    .WithMany(p => p.EncPreguntas)
                    .HasForeignKey(d => d.Idese)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_epr_ese");

                entity.HasOne(d => d.IdopyNavigation)
                    .WithMany(p => p.EncPreguntas)
                    .HasForeignKey(d => d.Idopy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_epr_opy");
            });

            modelBuilder.Entity<EncRespuestas>(entity =>
            {
                entity.ForNpgsqlHasComment("Registro de la Batería de Repuestas para todas las posibles preguntas");

                entity.Property(e => e.Idere)
                    .HasDefaultValueSql("nextval(('public.enc_ere_seq'::text)::regclass)")
                    .ForNpgsqlHasComment("Representa al identificador unica del registro en la tabla");

                entity.Property(e => e.Apiestado)
                    .HasDefaultValueSql("'ELABORADO'::character varying")
                    .ForNpgsqlHasComment("Estado en el que se encuentra el registro");

                entity.Property(e => e.Apitransaccion).HasDefaultValueSql("'CREAR'::character varying");

                entity.Property(e => e.Codigo).ForNpgsqlHasComment("Codigo de la respuesta");

                entity.Property(e => e.Feccre)
                    .HasDefaultValueSql("now()")
                    .ForNpgsqlHasComment("Fecha de creacion del registro");

                entity.Property(e => e.Fecmod).ForNpgsqlHasComment("Fecha en la que se ha realizado la ULTIMA modificacion registro");

                entity.Property(e => e.Idepr).ForNpgsqlHasComment("Representa al identificador de la tabla enc_pregunta al que esta asociado este registro");

                entity.Property(e => e.Respuesta).ForNpgsqlHasComment("Texto de la respuesta");

                entity.Property(e => e.Usucre)
                    .HasDefaultValueSql("\"current_user\"()")
                    .ForNpgsqlHasComment("Login o nombre de usuario que ha creado el registro");

                entity.Property(e => e.Usumod).ForNpgsqlHasComment("Login o nombre de usuario que ha realizado la ULTIMA modificacion registro");

                entity.HasOne(d => d.IdeprNavigation)
                    .WithMany(p => p.EncRespuestas)
                    .HasForeignKey(d => d.Idepr)
                    .HasConstraintName("fk_ere_epr");
            });

            modelBuilder.Entity<EncSecciones>(entity =>
            {
                entity.ForNpgsqlHasComment("Tabla donde se encuentran todas las secciones del proyecto");

                entity.Property(e => e.Idese)
                    .HasDefaultValueSql("nextval(('public.enc_ese_seq'::text)::regclass)")
                    .ForNpgsqlHasComment("Identificador de la seccion al que pertenece el registro");

                entity.Property(e => e.Abierta).HasDefaultValueSql("0");

                entity.Property(e => e.Apiestado)
                    .HasDefaultValueSql("'ELABORADO'::character varying")
                    .ForNpgsqlHasComment("Describe el estado en el que se encuentra un determinado registro");

                entity.Property(e => e.Apitransaccion).HasDefaultValueSql("'CREAR'::character varying");

                entity.Property(e => e.Codigo).ForNpgsqlHasComment("Codigo de seccion");

                entity.Property(e => e.Feccre)
                    .HasDefaultValueSql("now()")
                    .ForNpgsqlHasComment("Describe la fecha de creación de un determinado registro");

                entity.Property(e => e.Fecmod).ForNpgsqlHasComment("Describe la fecha de modificacción de determinado un registro");

                entity.Property(e => e.Idcnv).ForNpgsqlHasComment("Identificador del nivel al que pertenece el registro");

                entity.Property(e => e.Idopy).ForNpgsqlHasComment("Identificador del proyecto al que pertenece el registro");

                entity.Property(e => e.Seccion).ForNpgsqlHasComment("Texto o nombre de seccion");

                entity.Property(e => e.Usucre)
                    .HasDefaultValueSql("\"current_user\"()")
                    .ForNpgsqlHasComment("Describe el usuario que creo un determinado un registro");

                entity.Property(e => e.Usumod).ForNpgsqlHasComment("Describe el usuario que modifico un determinado registro");

                entity.HasOne(d => d.IdcnvNavigation)
                    .WithMany(p => p.EncSecciones)
                    .HasForeignKey(d => d.Idcnv)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_ese_cnv");

                entity.HasOne(d => d.IdopyNavigation)
                    .WithMany(p => p.EncSecciones)
                    .HasForeignKey(d => d.Idopy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_ese_opy");
            });

            modelBuilder.Entity<OpeBrigadas>(entity =>
            {
                entity.ForNpgsqlHasComment("Registro de las brigadas para los operativos de campo");

                entity.HasIndex(e => new { e.Idopy, e.Codigo })
                    .HasName("uk_obr_codigo")
                    .IsUnique();

                entity.Property(e => e.Idobr)
                    .HasDefaultValueSql("nextval(('public.ope_obr_seq'::text)::regclass)")
                    .ForNpgsqlHasComment("Es el identificador unico que representa al registro en la tabla");

                entity.Property(e => e.Apiestado)
                    .HasDefaultValueSql("'ELABORADO'::character varying")
                    .ForNpgsqlHasComment("Estado en el que se encuentra el registro");

                entity.Property(e => e.Apitransaccion)
                    .HasDefaultValueSql("'CREAR'::character varying")
                    .ForNpgsqlHasComment("Ultima transacción realizada en el registro");

                entity.Property(e => e.Codigo).ForNpgsqlHasComment("Codigo que representa a la brigada");

                entity.Property(e => e.Feccre)
                    .HasDefaultValueSql("now()")
                    .ForNpgsqlHasComment("Fecha de creacion del registro");

                entity.Property(e => e.Fecmod).ForNpgsqlHasComment("Fecha en la que se ha realizado la ULTIMA modificacion registro");

                entity.Property(e => e.Idcde).ForNpgsqlHasComment("Es el identificador del Departamento al que pertenece la brigada");

                entity.Property(e => e.Idopy).ForNpgsqlHasComment("Es el identificador del Proyecto al que pertenece la brigada");

                entity.Property(e => e.Usucre)
                    .HasDefaultValueSql("\"current_user\"()")
                    .ForNpgsqlHasComment("Login o nombre de usuario que ha creado el registro");

                entity.Property(e => e.Usumod).ForNpgsqlHasComment("Login o nombre de usuario que ha realizado la ULTIMA modificacion registro");

                entity.HasOne(d => d.IdcdeNavigation)
                    .WithMany(p => p.OpeBrigadas)
                    .HasForeignKey(d => d.Idcde)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_obr_cde");

                entity.HasOne(d => d.IdopyNavigation)
                    .WithMany(p => p.OpeBrigadas)
                    .HasForeignKey(d => d.Idopy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_obr_opy");
            });

            modelBuilder.Entity<OpeMovimientos>(entity =>
            {
                entity.Property(e => e.Idomv)
                    .HasDefaultValueSql("nextval(('public.ope_omv_seq'::text)::regclass)")
                    .ForNpgsqlHasComment("Es el identificador unico que representa al registro en la tabla");

                entity.Property(e => e.Apiestado)
                    .HasDefaultValueSql("'ELABORADO'::character varying")
                    .ForNpgsqlHasComment("Estado en el que se encuentra el registro");

                entity.Property(e => e.Apitransaccion)
                    .HasDefaultValueSql("'CREAR'::character varying")
                    .ForNpgsqlHasComment("Ultima transacción realizada en el registro");

                entity.Property(e => e.Feccre)
                    .HasDefaultValueSql("now()")
                    .ForNpgsqlHasComment("Fecha de creacion del registro");

                entity.Property(e => e.Fecmod).ForNpgsqlHasComment("Fecha en la que se ha realizado la ULTIMA modificacion registro");

                entity.Property(e => e.Idoup).ForNpgsqlHasComment("Es el identificador unico de la tabla cat_upm");

                entity.Property(e => e.Idsus).ForNpgsqlHasComment("Es el identificador unico de la tabla ope_asignacion");

                entity.Property(e => e.Usucre)
                    .HasDefaultValueSql("\"current_user\"()")
                    .ForNpgsqlHasComment("Login o nombre de usuario que ha creado el registro");

                entity.Property(e => e.Usumod).ForNpgsqlHasComment("Login o nombre de usuario que ha realizado la ULTIMA modificacion registro");

                entity.HasOne(d => d.IdoupNavigation)
                    .WithMany(p => p.OpeMovimientos)
                    .HasForeignKey(d => d.Idoup)
                    .HasConstraintName("fk_omv_oup");

                entity.HasOne(d => d.IdsusNavigation)
                    .WithMany(p => p.OpeMovimientos)
                    .HasForeignKey(d => d.Idsus)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_omv_sus");
            });

            modelBuilder.Entity<OpeProyectos>(entity =>
            {
                entity.ForNpgsqlHasComment("Codigo y descripcion de cada Proyecto");

                entity.Property(e => e.Idopy)
                    .HasDefaultValueSql("nextval(('public.ope_opy_seq'::text)::regclass)")
                    .ForNpgsqlHasComment("Llave primaria del identificador de la tabla");

                entity.Property(e => e.Apiestado)
                    .HasDefaultValueSql("'ELABORADO'::character varying")
                    .ForNpgsqlHasComment("Estado en el que se encuentra el registro: debe ser ACTIVO o INACTIVO");

                entity.Property(e => e.Apitransaccion)
                    .HasDefaultValueSql("'CREAR'::character varying")
                    .ForNpgsqlHasComment("Ultima transacción realizada en el registro");

                entity.Property(e => e.Codigo).ForNpgsqlHasComment("Codigo Unico de 4 CARACTERES con el que se identifica al Proyecto");

                entity.Property(e => e.Descripcion).ForNpgsqlHasComment("Descripcion del proyecto");

                entity.Property(e => e.Feccre)
                    .HasDefaultValueSql("now()")
                    .ForNpgsqlHasComment("Fecha de creacion del registro");

                entity.Property(e => e.Fecfin).ForNpgsqlHasComment("Fecha en la que FINALIZA el proyecto ");

                entity.Property(e => e.Fecinicio).ForNpgsqlHasComment("Fecha en la que INICIA el proyecto ");

                entity.Property(e => e.Fecmod).ForNpgsqlHasComment("Fecha en la que se ha realizado la ULTIMA modificacion registro");

                entity.Property(e => e.Nombre).ForNpgsqlHasComment("Nombre del Proyecto");

                entity.Property(e => e.Usucre)
                    .HasDefaultValueSql("\"current_user\"()")
                    .ForNpgsqlHasComment("Login o nombre de usuario que ha creado el registro");

                entity.Property(e => e.Usumod).ForNpgsqlHasComment("Login o nombre de usuario que ha realizado la ULTIMA modificacion registro");
            });

            modelBuilder.Entity<OpeUpms>(entity =>
            {
                entity.ForNpgsqlHasComment("Registro de las posibles UPMs por Proyecto");

                entity.HasIndex(e => new { e.Idopy, e.Idcde, e.Codigo })
                    .HasName("uk_oup_opy_cde_codigo")
                    .IsUnique();

                entity.Property(e => e.Idoup)
                    .HasDefaultValueSql("nextval(('public.ope_oup_seq'::text)::regclass)")
                    .ForNpgsqlHasComment("Es el identificador unico que representa al registro en la tabla");

                entity.Property(e => e.Apiestado)
                    .HasDefaultValueSql("'ELABORADO'::character varying")
                    .ForNpgsqlHasComment("Estado en el que se encuentra el registro");

                entity.Property(e => e.Apitransaccion)
                    .HasDefaultValueSql("'CREAR'::character varying")
                    .ForNpgsqlHasComment("Ultima transacción realizada en el registro");

                entity.Property(e => e.Codigo).ForNpgsqlHasComment("Codigo con el que se representa a la UPM");

                entity.Property(e => e.Feccre)
                    .HasDefaultValueSql("now()")
                    .ForNpgsqlHasComment("Fecha de creacion del registro");

                entity.Property(e => e.Fecinicio).ForNpgsqlHasComment("Fecha desde la que es valida la UPM");

                entity.Property(e => e.Fecmod).ForNpgsqlHasComment("Fecha en la que se ha realizado la ULTIMA modificacion registro");

                entity.Property(e => e.Idcde).ForNpgsqlHasComment("Es el identificador unico de la tabla cat_departamento");

                entity.Property(e => e.Idopy).ForNpgsqlHasComment("Es el identificador unico de la tabla seg_proyecto");

                entity.Property(e => e.Latitud)
                    .HasDefaultValueSql("0")
                    .ForNpgsqlHasComment("Latitud del punto CERO de la Capital de Departamento");

                entity.Property(e => e.Longitud)
                    .HasDefaultValueSql("0")
                    .ForNpgsqlHasComment("Longitud del punto CERO de la Capital de Departamento");

                entity.Property(e => e.Nombre).ForNpgsqlHasComment("Nombre con el que se representa a la UPM");

                entity.Property(e => e.Usucre)
                    .HasDefaultValueSql("\"current_user\"()")
                    .ForNpgsqlHasComment("Login o nombre de usuario que ha creado el registro");

                entity.Property(e => e.Usumod).ForNpgsqlHasComment("Login o nombre de usuario que ha realizado la ULTIMA modificacion registro");

                entity.HasOne(d => d.IdcdeNavigation)
                    .WithMany(p => p.OpeUpms)
                    .HasForeignKey(d => d.Idcde)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_oup_cde");

                entity.HasOne(d => d.IdopyNavigation)
                    .WithMany(p => p.OpeUpms)
                    .HasForeignKey(d => d.Idopy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_oup_opy");
            });

            modelBuilder.Entity<SegAplicaciones>(entity =>
            {
                entity.ForNpgsqlHasComment("Módulos del sistema");

                entity.HasIndex(e => e.Sigla)
                    .HasName("uk_sap_sigla")
                    .IsUnique();

                entity.Property(e => e.Idsap)
                    .HasDefaultValueSql("nextval('seg_sap_seq'::regclass)")
                    .ForNpgsqlHasComment("Identificador primario de registro");

                entity.Property(e => e.Apiestado)
                    .HasDefaultValueSql("'ELABORADO'::character varying")
                    .ForNpgsqlHasComment("Estado actual del registro");

                entity.Property(e => e.Apitransaccion)
                    .HasDefaultValueSql("'CREAR'::character varying")
                    .ForNpgsqlHasComment("Ultima transacción realizada en el registro");

                entity.Property(e => e.Descripcion).ForNpgsqlHasComment("Descripción de aplicación");

                entity.Property(e => e.Feccre)
                    .HasDefaultValueSql("now()")
                    .ForNpgsqlHasComment("Fecha en la que el registro fue creado");

                entity.Property(e => e.Fecmod).ForNpgsqlHasComment("Fecha de última modificación del registro");

                entity.Property(e => e.Nombre).ForNpgsqlHasComment("Nombre de Aplicación del Sistema");

                entity.Property(e => e.Sigla).ForNpgsqlHasComment("Sigla de Aplicación del Sistema");

                entity.Property(e => e.Usucre)
                    .HasDefaultValueSql("\"current_user\"()")
                    .ForNpgsqlHasComment("Usuario que realizó la creación del registro");

                entity.Property(e => e.Usumod).ForNpgsqlHasComment("Usuario que realizó la última modificación en le registro");
            });

            modelBuilder.Entity<SegConfiguracion>(entity =>
            {
                entity.ForNpgsqlHasComment("Almacena la configuracion posible por Tabla");

                entity.Property(e => e.Idscf)
                    .HasDefaultValueSql("nextval('seg_scf_seq'::regclass)")
                    .ForNpgsqlHasComment("Identificador primario de registro");

                entity.Property(e => e.Apiestado)
                    .HasDefaultValueSql("'ELABORADO'::character varying")
                    .ForNpgsqlHasComment("Estado actual del registro");

                entity.Property(e => e.Apitransaccion)
                    .HasDefaultValueSql("'CREAR'::character varying")
                    .ForNpgsqlHasComment("Ultima transacción realizada en el registro");

                entity.Property(e => e.Configuracion).ForNpgsqlHasComment("Definimos el nombre de la funcion a ejecutar");

                entity.Property(e => e.Feccre)
                    .HasDefaultValueSql("now()")
                    .ForNpgsqlHasComment("Fecha en la que se realizó la creación del registro");

                entity.Property(e => e.Parametrosentrada)
                    .HasDefaultValueSql("'[auth:json, datos:json]'::character varying")
                    .ForNpgsqlHasComment("parametros de entrada de la function, el parametro de entrada se reemplaza por un ? en el campo funcionsco; [*] significa todos los parametros");

                entity.Property(e => e.Parametrossalida)
                    .HasDefaultValueSql("'*'::character varying")
                    .ForNpgsqlHasComment("define los parametros de salida de la function , ejemplo idusuario,login o simplemente *");

                entity.Property(e => e.Usucre)
                    .HasDefaultValueSql("\"current_user\"()")
                    .ForNpgsqlHasComment("Usuario que realizó la creación del registro");

                entity.Property(e => e.Usumod).ForNpgsqlHasComment("Usuario que realizó la última modificación del registro");

                entity.HasOne(d => d.IdstaNavigation)
                    .WithMany(p => p.SegConfiguracion)
                    .HasForeignKey(d => d.Idsta)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_scf_sta");
            });

            modelBuilder.Entity<SegEstados>(entity =>
            {
                entity.ForNpgsqlHasComment("Almacena todos los posibles estados que puedan poseer los registro de cada una de las tablas, deberá existir siempre el estado estado ELABORADO, que es el estado en el cual se encontrarán todos los registros una vez que hayan sido creados");

                entity.HasIndex(e => new { e.Idses, e.Idsta })
                    .HasName("uk_ses_sta")
                    .IsUnique();

                entity.HasIndex(e => new { e.Idsta, e.Estado })
                    .HasName("uk_ses_estado")
                    .IsUnique();

                entity.Property(e => e.Idses)
                    .HasDefaultValueSql("nextval('seg_ses_seq'::regclass)")
                    .ForNpgsqlHasComment("Identificador primario de registro");

                entity.Property(e => e.Apiestado)
                    .HasDefaultValueSql("'ELABORADO'::character varying")
                    .ForNpgsqlHasComment("Estado actual del registro");

                entity.Property(e => e.Apitransaccion)
                    .HasDefaultValueSql("'CREAR'::character varying")
                    .ForNpgsqlHasComment("Ultima transacción realizada en el registro");

                entity.Property(e => e.Descripcion).ForNpgsqlHasComment("Describe el el significado del Estado de esta tabla");

                entity.Property(e => e.Estado).ForNpgsqlHasComment("Estado de transición");

                entity.Property(e => e.Feccre)
                    .HasDefaultValueSql("now()")
                    .ForNpgsqlHasComment("Fecha en la que el registro fue creado");

                entity.Property(e => e.Fecmod).ForNpgsqlHasComment("Fecha de última modificación del registro");

                entity.Property(e => e.Idsta).ForNpgsqlHasComment("ID de la tabla");

                entity.Property(e => e.Usucre)
                    .HasDefaultValueSql("\"current_user\"()")
                    .ForNpgsqlHasComment("Usuario que realizó la creación del registro");

                entity.Property(e => e.Usumod).ForNpgsqlHasComment("Usuario que realizó la última modificación del registro");

                entity.HasOne(d => d.IdstaNavigation)
                    .WithMany(p => p.SegEstados)
                    .HasForeignKey(d => d.Idsta)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_ses_sta");
            });

            modelBuilder.Entity<SegGlosas>(entity =>
            {
                entity.ForNpgsqlHasComment("Registro de razones, justificaciones o motivos por los cuales se realiza una determinada transacción en un documento");

                entity.Property(e => e.Idsgl)
                    .HasDefaultValueSql("nextval('seg_sgl_seq'::regclass)")
                    .ForNpgsqlHasComment("Identificador primario de registro");

                entity.Property(e => e.Apiestado)
                    .HasDefaultValueSql("'ELABORADO'::character varying")
                    .ForNpgsqlHasComment("Estado actual del registro");

                entity.Property(e => e.Apitransaccion)
                    .HasDefaultValueSql("'CREAR'::character varying")
                    .ForNpgsqlHasComment("Ultima transacción realizada en el registro");

                entity.Property(e => e.Feccre)
                    .HasDefaultValueSql("now()")
                    .ForNpgsqlHasComment("Fecha en la que se realizó la creación del registro");

                entity.Property(e => e.Fecmod).ForNpgsqlHasComment("Fecha en la que se realizó la última modificación del registro");

                entity.Property(e => e.Glosa).ForNpgsqlHasComment("Glosa que describe la acción realizada sobre el registro");

                entity.Property(e => e.Iddoc).ForNpgsqlHasComment("Identificador primario del documento al que hace referencia");

                entity.Property(e => e.Nombretabla).ForNpgsqlHasComment("Nombre de la tabla donde se realiza la transacción");

                entity.Property(e => e.Transaccion).ForNpgsqlHasComment("Transacción que se realiza en la tabla");

                entity.Property(e => e.Usucre)
                    .HasDefaultValueSql("\"current_user\"()")
                    .ForNpgsqlHasComment("Usuario que realizó la creación del registro");

                entity.Property(e => e.Usumod).ForNpgsqlHasComment("Usuario que realizó la última modificación del registro");

                entity.HasOne(d => d.NombretablaNavigation)
                    .WithMany(p => p.SegGlosas)
                    .HasPrincipalKey(p => p.Nombretabla)
                    .HasForeignKey(d => d.Nombretabla)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_sgl_sta");
            });

            modelBuilder.Entity<SegMensajes>(entity =>
            {
                entity.ForNpgsqlHasComment("Almacena los mensajes de error que se originan en la operación del sistema, se clasifica los mismos por el código de aplicación");

                entity.HasIndex(e => e.Aplicacionerror)
                    .HasName("uk_sme_aplicacionerror")
                    .IsUnique();

                entity.Property(e => e.Idsme)
                    .HasDefaultValueSql("nextval('seg_sme_seq'::regclass)")
                    .ForNpgsqlHasComment("Identificador primario del registro");

                entity.Property(e => e.Accion).ForNpgsqlHasComment("Acción que se debe realizar para subsanar el error");

                entity.Property(e => e.Apiestado)
                    .HasDefaultValueSql("'ELABORADO'::character varying")
                    .ForNpgsqlHasComment("Estado actual del registro");

                entity.Property(e => e.Apitransaccion)
                    .HasDefaultValueSql("'CREAR'::character varying")
                    .ForNpgsqlHasComment("Ultima transacción realizada en el registro");

                entity.Property(e => e.Aplicacionerror).ForNpgsqlHasComment("Concatenación del número de error, con la aplicación a la que este pertenece");

                entity.Property(e => e.Causa).ForNpgsqlHasComment("Descripción detallada de por que se origina el error");

                entity.Property(e => e.Comentario).ForNpgsqlHasComment("Comentario realizado acerca del error, puede ser utilizado por el desarrollador");

                entity.Property(e => e.Feccre)
                    .HasDefaultValueSql("now()")
                    .ForNpgsqlHasComment("Fecha en la que el registro fue creado");

                entity.Property(e => e.Fecmod).ForNpgsqlHasComment("Fecha de última modificación del registro");

                entity.Property(e => e.Idsap).ForNpgsqlHasComment("Aplicación al que pertenece el mensaje");

                entity.Property(e => e.Origen).ForNpgsqlHasComment("Origen físico donde se ha originado el error");

                entity.Property(e => e.Texto).ForNpgsqlHasComment("Texto descriptivo del mensaje de error");

                entity.Property(e => e.Usucre)
                    .HasDefaultValueSql("\"current_user\"()")
                    .ForNpgsqlHasComment("Usuario que realizó la creación del registro");

                entity.Property(e => e.Usumod).ForNpgsqlHasComment("Usuario que realizó la última modificación del registro");

                entity.HasOne(d => d.IdsapNavigation)
                    .WithMany(p => p.SegMensajes)
                    .HasForeignKey(d => d.Idsap)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_sme_sap");
            });

            modelBuilder.Entity<SegPaginas>(entity =>
            {
                entity.ForNpgsqlHasComment("Contiene los nombres fisico de las todas las paginas del sistema, clasificadas por aplicacion, se valida que la extencion del nombre de pagina termine con los caracteres .aspx");

                entity.Property(e => e.Idspg)
                    .HasDefaultValueSql("nextval('seg_spg_seq'::regclass)")
                    .ForNpgsqlHasComment("Identificador primario de registro");

                entity.Property(e => e.Accion).ForNpgsqlHasComment("Accion de la pagina");

                entity.Property(e => e.Apiestado)
                    .HasDefaultValueSql("'ELABORADO'::character varying")
                    .ForNpgsqlHasComment("Estado actual del registro");

                entity.Property(e => e.Apitransaccion)
                    .HasDefaultValueSql("'CREAR'::character varying")
                    .ForNpgsqlHasComment("Ultima transacción realizada en el registro");

                entity.Property(e => e.Descripcion).ForNpgsqlHasComment("Descripción de funcionalidad de la página");

                entity.Property(e => e.Feccre)
                    .HasDefaultValueSql("now()")
                    .ForNpgsqlHasComment("Fecha en la que se realizó la creación del registro");

                entity.Property(e => e.Fecmod).ForNpgsqlHasComment("Fecha en la que se realizó la última modificación del registro");

                entity.Property(e => e.Icono).ForNpgsqlHasComment("icono de la página obtenidos de font awesome");

                entity.Property(e => e.Idsap).ForNpgsqlHasComment("Identificador primario de aplicación a la que pertenece la página");

                entity.Property(e => e.Metodo).ForNpgsqlHasComment("Metodo de la pagina");

                entity.Property(e => e.Nivel).ForNpgsqlHasComment("en que nivel se encuentra la página,");

                entity.Property(e => e.Nombremenu).ForNpgsqlHasComment("Nombre del menu en el sistema");

                entity.Property(e => e.Paginapadre).ForNpgsqlHasComment("identificador del padre, si es null es padre");

                entity.Property(e => e.Prioridad)
                    .HasDefaultValueSql("1")
                    .ForNpgsqlHasComment("En que prioridad se desplegara la pagina");

                entity.Property(e => e.Sigla).ForNpgsqlHasComment("Sigla de la página, no debe existir repetidos");

                entity.Property(e => e.Usucre)
                    .HasDefaultValueSql("\"current_user\"()")
                    .ForNpgsqlHasComment("Usuario que realizó la creación del registro");

                entity.Property(e => e.Usumod).ForNpgsqlHasComment("Usuario que realizó la última modificación del registro");

                entity.HasOne(d => d.IdsapNavigation)
                    .WithMany(p => p.SegPaginas)
                    .HasForeignKey(d => d.Idsap)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_spg_sap");
            });

            modelBuilder.Entity<SegRoles>(entity =>
            {
                entity.ForNpgsqlHasComment("Definicion de ROLES de operacion en el sistema que se asignan a los distintos usuarios");

                entity.Property(e => e.Idsro)
                    .HasDefaultValueSql("nextval('seg_sro_seq'::regclass)")
                    .ForNpgsqlHasComment("Identificador primario de registro");

                entity.Property(e => e.Apiestado)
                    .HasDefaultValueSql("'ELABORADO'::character varying")
                    .ForNpgsqlHasComment("Estado actual del registro");

                entity.Property(e => e.Apitransaccion)
                    .HasDefaultValueSql("'CREAR'::character varying")
                    .ForNpgsqlHasComment("Ultima transacción realizada en el registro");

                entity.Property(e => e.Descripcion).ForNpgsqlHasComment("Descripción detallada del rol y su funcionalidad");

                entity.Property(e => e.Feccre)
                    .HasDefaultValueSql("now()")
                    .ForNpgsqlHasComment("Fecha en la que se realizó la creación del registro");

                entity.Property(e => e.Fecmod).ForNpgsqlHasComment("Fecha en la que se realizó la última modificación del registro");

                entity.Property(e => e.Sigla).ForNpgsqlHasComment("Sigla del rol");

                entity.Property(e => e.Usucre)
                    .HasDefaultValueSql("\"current_user\"()")
                    .ForNpgsqlHasComment("Usuario que realizó la creación del registro");

                entity.Property(e => e.Usumod).ForNpgsqlHasComment("Usuario que realizó la última modificación del registro");
            });

            modelBuilder.Entity<SegRolesPagina>(entity =>
            {
                entity.ForNpgsqlHasComment("Registra las diferentes paginas que son accesibles por un determinado rol");

                entity.Property(e => e.Idsrp)
                    .HasDefaultValueSql("nextval('seg_srp_seq'::regclass)")
                    .ForNpgsqlHasComment("Identificador primario de registro");

                entity.Property(e => e.Apiestado)
                    .HasDefaultValueSql("'ELABORADO'::character varying")
                    .ForNpgsqlHasComment("Estado actual del registro");

                entity.Property(e => e.Apitransaccion)
                    .HasDefaultValueSql("'CREAR'::character varying")
                    .ForNpgsqlHasComment("Ultima transacción realizada en el registro");

                entity.Property(e => e.Feccre)
                    .HasDefaultValueSql("now()")
                    .ForNpgsqlHasComment("Fecha en la que se realizó la creación del registro");

                entity.Property(e => e.Fecmod).ForNpgsqlHasComment("Fecha en la que se realizó la última modificación del registro");

                entity.Property(e => e.Idspg).ForNpgsqlHasComment("Identificador primario de página que se asigna al rol de operación");

                entity.Property(e => e.Idsro).ForNpgsqlHasComment("Identificador primario de rol al que se le asigna una página");

                entity.Property(e => e.Usucre)
                    .HasDefaultValueSql("\"current_user\"()")
                    .ForNpgsqlHasComment("Usuario que realizó la creación del registro");

                entity.Property(e => e.Usumod).ForNpgsqlHasComment("Usuario que realizó la última modificación del registro");

                entity.HasOne(d => d.IdspgNavigation)
                    .WithMany(p => p.SegRolesPagina)
                    .HasForeignKey(d => d.Idspg)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_srp_spg");

                entity.HasOne(d => d.IdsroNavigation)
                    .WithMany(p => p.SegRolesPagina)
                    .HasForeignKey(d => d.Idsro)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_srp_sro");
            });

            modelBuilder.Entity<SegRolesTablaTransaccion>(entity =>
            {
                entity.ForNpgsqlHasComment("Permite relacionar las tablas a las cuales tiene tiene acceso el rol y define tambien las transacciones de esa tabla que el usuario asignado a este rol puede realizar");

                entity.Property(e => e.Idstt)
                    .HasDefaultValueSql("nextval('seg_stt_seq'::regclass)")
                    .ForNpgsqlHasComment("Identificador primario de registro");

                entity.Property(e => e.Apiestado)
                    .HasDefaultValueSql("'ELABORADO'::character varying")
                    .ForNpgsqlHasComment("Estado actual del registro");

                entity.Property(e => e.Apitransaccion)
                    .HasDefaultValueSql("'CREAR'::character varying")
                    .ForNpgsqlHasComment("Ultima transacción realizada en el registro");

                entity.Property(e => e.Feccre)
                    .HasDefaultValueSql("now()")
                    .ForNpgsqlHasComment("Fecha en la que se realizó la creación del registro");

                entity.Property(e => e.Fecmod).ForNpgsqlHasComment("Fecha en la que se realizó la última modificación del registro");

                entity.Property(e => e.Idsro).ForNpgsqlHasComment("Identificador primario de rol de operación al que se asignan los permisos de ejecución");

                entity.Property(e => e.Idsta).ForNpgsqlHasComment("Identificador primmario de tabla a la que tiene acceso el rol de operación");

                entity.Property(e => e.Idstr).ForNpgsqlHasComment("Identificador primario de transacción que el rol de operación puede realizar en la tabla");

                entity.Property(e => e.Usucre)
                    .HasDefaultValueSql("\"current_user\"()")
                    .ForNpgsqlHasComment("Usuario que realizó la creación del registro");

                entity.Property(e => e.Usumod).ForNpgsqlHasComment("Usuario que realizó la última modificación del registro");

                entity.HasOne(d => d.IdsroNavigation)
                    .WithMany(p => p.SegRolesTablaTransaccion)
                    .HasForeignKey(d => d.Idsro)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_stt_sro");

                entity.HasOne(d => d.Idst)
                    .WithMany(p => p.SegRolesTablaTransaccion)
                    .HasPrincipalKey(p => new { p.Idstr, p.Idsta })
                    .HasForeignKey(d => new { d.Idstr, d.Idsta })
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_stt_str");
            });

            modelBuilder.Entity<SegTablas>(entity =>
            {
                entity.ForNpgsqlHasComment("Almacena las tablas del sistema y su respectiva descripcion");

                entity.HasIndex(e => e.Alias)
                    .HasName("uk_sta_alias")
                    .IsUnique();

                entity.HasIndex(e => e.Nombretabla)
                    .HasName("uk_sta_nombretabla")
                    .IsUnique();

                entity.Property(e => e.Idsta)
                    .HasDefaultValueSql("nextval('seg_sta_seq'::regclass)")
                    .ForNpgsqlHasComment("Identificador primario de registro");

                entity.Property(e => e.Afterrow)
                    .HasDefaultValueSql("false")
                    .ForNpgsqlHasComment("Indica si existirán RdN's en esta opción del disparador");

                entity.Property(e => e.Afterstatement)
                    .HasDefaultValueSql("false")
                    .ForNpgsqlHasComment("Indica si existirán RdN's en esta opción del disparador");

                entity.Property(e => e.Alias).ForNpgsqlHasComment("Alias de tabla, identificador único de tabla se utiliza este valor para identificar a los procedimientos de la misma");

                entity.Property(e => e.Apiestado)
                    .HasDefaultValueSql("'ELABORADO'::character varying")
                    .ForNpgsqlHasComment("Estado actual del registro");

                entity.Property(e => e.Apitransaccion)
                    .HasDefaultValueSql("'CREAR'::character varying")
                    .ForNpgsqlHasComment("Ultima transacción realizada en el registro");

                entity.Property(e => e.Beforerow)
                    .HasDefaultValueSql("true")
                    .ForNpgsqlHasComment("Indica si existirán RdN's en esta opción del disparador");

                entity.Property(e => e.Beforestatement)
                    .HasDefaultValueSql("false")
                    .ForNpgsqlHasComment("Indica si existirán RdN's en esta opción del disparador");

                entity.Property(e => e.Descripcion).ForNpgsqlHasComment("Descripciòn de objetos que almacena la tabla");

                entity.Property(e => e.Feccre)
                    .HasDefaultValueSql("now()")
                    .ForNpgsqlHasComment("Fecha en la que el registro fue creado");

                entity.Property(e => e.Fecmod).ForNpgsqlHasComment("Fecha de última modificación del registro");

                entity.Property(e => e.Idsap).ForNpgsqlHasComment("Identificador primario de aplicación a la que pertenece este registro");

                entity.Property(e => e.Nombretabla).ForNpgsqlHasComment("Nombre de tabla");

                entity.Property(e => e.Usucre)
                    .HasDefaultValueSql("\"current_user\"()")
                    .ForNpgsqlHasComment("Usuario que realizó la creación del registro");

                entity.Property(e => e.Usumod).ForNpgsqlHasComment("Usuario que realizó la última modificación del registro");

                entity.HasOne(d => d.IdsapNavigation)
                    .WithMany(p => p.SegTablas)
                    .HasForeignKey(d => d.Idsap)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_sta_sap");
            });

            modelBuilder.Entity<SegTransacciones>(entity =>
            {
                entity.ForNpgsqlHasComment("Almacena las TRANSACCIONES que pueden ser realizadas en una TABLA particular");

                entity.HasIndex(e => new { e.Idsta, e.Transaccion })
                    .HasName("uk_str_idSta_Transaccion")
                    .IsUnique();

                entity.HasIndex(e => new { e.Idstr, e.Idsta })
                    .HasName("uk_str_idstr_idSta")
                    .IsUnique();

                entity.Property(e => e.Idstr)
                    .HasDefaultValueSql("nextval('seg_str_seq'::regclass)")
                    .ForNpgsqlHasComment("Identificador primario de registro");

                entity.Property(e => e.Apiestado)
                    .HasDefaultValueSql("'ELABORADO'::character varying")
                    .ForNpgsqlHasComment("Estado actual del registro");

                entity.Property(e => e.Apitransaccion)
                    .HasDefaultValueSql("'CREAR'::character varying")
                    .ForNpgsqlHasComment("Ultima transacción realizada en el registro");

                entity.Property(e => e.Descripcion).ForNpgsqlHasComment("Descripción de lo que la transacción realiza");

                entity.Property(e => e.Feccre)
                    .HasDefaultValueSql("now()")
                    .ForNpgsqlHasComment("Fecha en la que el registro fue creado");

                entity.Property(e => e.Fecmod).ForNpgsqlHasComment("Fecha de última modificación del registro");

                entity.Property(e => e.Idsta).ForNpgsqlHasComment("Identificador primario de tabla a la que pertenece el estado");

                entity.Property(e => e.Sentencia).ForNpgsqlHasComment("Indica la sentencia en la que se realiza la transacción");

                entity.Property(e => e.Transaccion).ForNpgsqlHasComment("Nombre de transacción");

                entity.Property(e => e.Usucre)
                    .HasDefaultValueSql("\"current_user\"()")
                    .ForNpgsqlHasComment("Usuario que realizó la creación del registro");

                entity.Property(e => e.Usumod).ForNpgsqlHasComment("Usuario que realizó la última modificación del registro");

                entity.HasOne(d => d.IdstaNavigation)
                    .WithMany(p => p.SegTransacciones)
                    .HasForeignKey(d => d.Idsta)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_str_sta");
            });

            modelBuilder.Entity<SegTransiciones>(entity =>
            {
                entity.ForNpgsqlHasComment("Indica las TRANSICIONES entre ESTADOS que se definen para una determinada TABLA");

                entity.HasIndex(e => new { e.Idsta, e.Idsesini, e.Idstr, e.Idsesfin })
                    .HasName("uk_sts_idsta_estTraTrs")
                    .IsUnique();

                entity.Property(e => e.Idsts)
                    .HasDefaultValueSql("nextval('seg_sts_seq'::regclass)")
                    .ForNpgsqlHasComment("Identificador primario de registro");

                entity.Property(e => e.Apiestado)
                    .HasDefaultValueSql("'ELABORADO'::character varying")
                    .ForNpgsqlHasComment("Estado actual del registro");

                entity.Property(e => e.Apitransaccion)
                    .HasDefaultValueSql("'CREAR'::character varying")
                    .ForNpgsqlHasComment("Ultima transacción realizada en el registro");

                entity.Property(e => e.Feccre)
                    .HasDefaultValueSql("now()")
                    .ForNpgsqlHasComment("Fecha en la que el registro fue creado");

                entity.Property(e => e.Fecmod).ForNpgsqlHasComment("Fecha de última modificación del registro");

                entity.Property(e => e.Idsesfin).ForNpgsqlHasComment("Identificador primario de estado final de la transición");

                entity.Property(e => e.Idsesini).ForNpgsqlHasComment("Identificador primario de estado inicial");

                entity.Property(e => e.Idsta).ForNpgsqlHasComment("Identificador primario de la tabla a la que pertenece el registro");

                entity.Property(e => e.Idstr).ForNpgsqlHasComment("Identificador primario de transacción");

                entity.Property(e => e.Usucre)
                    .HasDefaultValueSql("\"current_user\"()")
                    .ForNpgsqlHasComment("Usuario que realizó la creación del registro");

                entity.Property(e => e.Usumod).ForNpgsqlHasComment("Usuario que realizó la última modificación del registro");

                entity.HasOne(d => d.Idst)
                    .WithMany(p => p.SegTransiciones)
                    .HasPrincipalKey(p => new { p.Idstr, p.Idsta })
                    .HasForeignKey(d => new { d.Idstr, d.Idsta })
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_sts_str");
            });

            modelBuilder.Entity<SegUsuarios>(entity =>
            {
                entity.ForNpgsqlHasComment("Almacena la informacion de usuarios del sistema SGIBS que poseen conexion a sus distintos modulos");

                entity.Property(e => e.Idsus)
                    .HasDefaultValueSql("nextval('seg_sus_seq'::regclass)")
                    .ForNpgsqlHasComment("Identificador primario de registro");

                entity.Property(e => e.Apellidos).ForNpgsqlHasComment("Apellidos del usuario");

                entity.Property(e => e.Apiestado)
                    .HasDefaultValueSql("'ELABORADO'::character varying")
                    .ForNpgsqlHasComment("Estado actual del registro");

                entity.Property(e => e.Apitransaccion)
                    .HasDefaultValueSql("'CREAR'::character varying")
                    .ForNpgsqlHasComment("Ultima transacción realizada en el registro");

                entity.Property(e => e.Correo).ForNpgsqlHasComment("Correo Electronico del usuario");

                entity.Property(e => e.Feccre)
                    .HasDefaultValueSql("now()")
                    .ForNpgsqlHasComment("Fecha en la que se realizó la creación del registro");

                entity.Property(e => e.Fecmod).ForNpgsqlHasComment("Fecha en la que se realizó la última modificación del registro");

                entity.Property(e => e.Idcde).ForNpgsqlHasComment("Departamento al que pertenece el usuario");

                entity.Property(e => e.Idobr).ForNpgsqlHasComment("Brigada a la que pertenece el usuario");

                entity.Property(e => e.Login).ForNpgsqlHasComment("Nombre de usuario en el sistema");

                entity.Property(e => e.Nombres).ForNpgsqlHasComment("Nombre del usuario");

                entity.Property(e => e.Password).ForNpgsqlHasComment("contraseña encriptada en hash");

                entity.Property(e => e.Tablet).ForNpgsqlHasComment("Serie de la Tablet");

                entity.Property(e => e.Usucre)
                    .HasDefaultValueSql("\"current_user\"()")
                    .ForNpgsqlHasComment("Usuario que realizó la creación del registro");

                entity.Property(e => e.Usumod).ForNpgsqlHasComment("Usuario que realizó la última modificación del registro");

                entity.Property(e => e.Vigente)
                    .HasDefaultValueSql("1")
                    .ForNpgsqlHasComment("Indica si el usuario está vigente en el sistema. 1: Está Vigente; 0 No vigente");

                entity.HasOne(d => d.IdcdeNavigation)
                    .WithMany(p => p.SegUsuarios)
                    .HasForeignKey(d => d.Idcde)
                    .HasConstraintName("fk_sus_cde");

                entity.HasOne(d => d.IdobrNavigation)
                    .WithMany(p => p.SegUsuarios)
                    .HasForeignKey(d => d.Idobr)
                    .HasConstraintName("fk_sus_obr");
            });

            modelBuilder.Entity<SegUsuariosRestriccion>(entity =>
            {
                entity.ForNpgsqlHasComment("Registro de usuarios del sistema, se definen aqui el o los distintos roles de operacion que posee un usuario, tambien el nivel de restriccion para cada uno de los roles definidos, los niveles de restriccion se dan a nivel de institucion, gerencia administrativa y unidad ejecutora");

                entity.Property(e => e.Idsur)
                    .HasDefaultValueSql("nextval('seg_sur_seq'::regclass)")
                    .ForNpgsqlHasComment("Identificador primario de registro");

                entity.Property(e => e.Apiestado)
                    .HasDefaultValueSql("'ELABORADO'::character varying")
                    .ForNpgsqlHasComment("Estado actual del registro");

                entity.Property(e => e.Apitransaccion)
                    .HasDefaultValueSql("'CREAR'::character varying")
                    .ForNpgsqlHasComment("Ultima transacción realizada en el registro");

                entity.Property(e => e.Feccre)
                    .HasDefaultValueSql("now()")
                    .ForNpgsqlHasComment("Fecha en la que se realizó la creación del registro");

                entity.Property(e => e.Fecmod).ForNpgsqlHasComment("Fecha en la que se realizó la última modificación del registro");

                entity.Property(e => e.Idcde).ForNpgsqlHasComment("Identificador primario del departamento");

                entity.Property(e => e.Idopy).ForNpgsqlHasComment("Identificador primario del proyecto");

                entity.Property(e => e.Idsro).ForNpgsqlHasComment("Identificador primario de rol de operación que se asigna al usuario");

                entity.Property(e => e.Idsus).ForNpgsqlHasComment("Identificador primario de usuario al que se le asigna el rol");

                entity.Property(e => e.Rolactivo).ForNpgsqlHasComment("Si el usuartio tiene más de un rol, este campo indica si este rol es el rol activo para realizar operaciones en la aplicación");

                entity.Property(e => e.Usucre)
                    .HasDefaultValueSql("\"current_user\"()")
                    .ForNpgsqlHasComment("Usuario que realizó la creación del registro");

                entity.Property(e => e.Usumod).ForNpgsqlHasComment("Usuario que realizó la última modificación del registro");

                entity.Property(e => e.Vigente)
                    .HasDefaultValueSql("1")
                    .ForNpgsqlHasComment("Indica si el rol de operación está vigente. Este valor tiene mayor eso específico que la fecha de vigencia, si este campo indica 0 (No vigente) no importa si la fecha de vigencia si lo está, el rol no está vigente. 1: Vigente; 0 No vigente");

                entity.HasOne(d => d.IdcdeNavigation)
                    .WithMany(p => p.SegUsuariosRestriccion)
                    .HasForeignKey(d => d.Idcde)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_sur_cde");

                entity.HasOne(d => d.IdopyNavigation)
                    .WithMany(p => p.SegUsuariosRestriccion)
                    .HasForeignKey(d => d.Idopy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_sur_opy");

                entity.HasOne(d => d.IdsroNavigation)
                    .WithMany(p => p.SegUsuariosRestriccion)
                    .HasForeignKey(d => d.Idsro)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_sur_sro");

                entity.HasOne(d => d.IdsusNavigation)
                    .WithMany(p => p.SegUsuariosRestriccion)
                    .HasForeignKey(d => d.Idsus)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_sur_sus");
            });

            modelBuilder.HasSequence("cat_cde_seq")
                .HasMin(0)
                .HasMax(2147483647);

            modelBuilder.HasSequence("cat_cnv_seq")
                .HasMin(0)
                .HasMax(2147483647);

            modelBuilder.HasSequence("cat_ctp_seq")
                .HasMin(0)
                .HasMax(2147483647);

            modelBuilder.HasSequence("enc_ein_seq")
                .HasMin(0)
                .HasMax(2147483647);

            modelBuilder.HasSequence("enc_enc_seq")
                .HasMin(0)
                .HasMax(2147483647);

            modelBuilder.HasSequence("enc_epr_seq")
                .HasMin(0)
                .HasMax(2147483647);

            modelBuilder.HasSequence("enc_ere_seq")
                .HasMin(0)
                .HasMax(2147483647);

            modelBuilder.HasSequence("enc_ese_seq")
                .HasMin(0)
                .HasMax(2147483647);

            modelBuilder.HasSequence("ope_efl_seq")
                .HasMin(0)
                .HasMax(2147483647);

            modelBuilder.HasSequence("ope_obr_seq")
                .HasMin(0)
                .HasMax(2147483647);

            modelBuilder.HasSequence("ope_omv_seq")
                .HasMin(0)
                .HasMax(2147483647);

            modelBuilder.HasSequence("ope_opy_seq")
                .HasMin(0)
                .HasMax(2147483647);

            modelBuilder.HasSequence("ope_oup_seq")
                .HasMin(0)
                .HasMax(2147483647);

            modelBuilder.HasSequence("seg_sap_seq");

            modelBuilder.HasSequence("seg_scf_seq");

            modelBuilder.HasSequence("seg_ses_seq");

            modelBuilder.HasSequence("seg_sgl_seq");

            modelBuilder.HasSequence("seg_sme_seq");

            modelBuilder.HasSequence("seg_spe_seq");

            modelBuilder.HasSequence("seg_spg_seq");

            modelBuilder.HasSequence("seg_sro_seq");

            modelBuilder.HasSequence("seg_srp_seq");

            modelBuilder.HasSequence("seg_sta_seq");

            modelBuilder.HasSequence("seg_str_seq");

            modelBuilder.HasSequence("seg_sts_seq");

            modelBuilder.HasSequence("seg_stt_seq");

            modelBuilder.HasSequence("seg_sur_seq");

            modelBuilder.HasSequence("seg_sus_seq");
        }
    }
}
