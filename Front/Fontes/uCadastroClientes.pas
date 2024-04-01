{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N-,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED ON}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN TYPEINFO_IMPLICITLY_ADDED ON}
{$WARN RLINK_WARNING ON}
{$WARN IMPLICIT_STRING_CAST ON}
{$WARN IMPLICIT_STRING_CAST_LOSS ON}
{$WARN EXPLICIT_STRING_CAST OFF}
{$WARN EXPLICIT_STRING_CAST_LOSS OFF}
{$WARN CVT_WCHAR_TO_ACHAR ON}
{$WARN CVT_NARROWING_STRING_LOST ON}
{$WARN CVT_ACHAR_TO_WCHAR ON}
{$WARN CVT_WIDENING_STRING_LOST ON}
{$WARN NON_PORTABLE_TYPECAST ON}
{$WARN XML_WHITESPACE_NOT_ALLOWED ON}
{$WARN XML_UNKNOWN_ENTITY ON}
{$WARN XML_INVALID_NAME_START ON}
{$WARN XML_INVALID_NAME ON}
{$WARN XML_EXPECTED_CHARACTER ON}
{$WARN XML_CREF_NO_RESOLVE ON}
{$WARN XML_NO_PARM ON}
{$WARN XML_NO_MATCHING_PARM ON}
{$WARN IMMUTABLE_STRINGS OFF}
unit uCadastroClientes;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,

  IdHTTP,
  IdURI,
  IdSSLOpenSSL,

  ACBrCEP,

  Vcl.ExtCtrls,
  Vcl.DBCtrls,
  Vcl.BaseImageCollection,
  Vcl.ImageCollection,
  Vcl.ImgList,
  Vcl.ComCtrls,
  Vcl.ToolWin,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Mask,

  Data.DB,
  DBClient,

  FireDAC.Comp.Client,
  FireDAC.DApt,
  FireDAC.Stan.StorageBin,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet;

type
  TfrnPrincipal = class(TForm)
    pBarra: TPanel;
    StatusBar1: TStatusBar;
    btnFiltrar: TButton;
    btnExcluir: TButton;
    btncNovoRegistro: TButton;
    btnCancelar: TButton;
    btnSalvar: TButton;
    btnVoltar: TButton;
    pFiltro: TPanel;
    DBGrid1: TDBGrid;
    edtNome: TEdit;
    lbNome: TLabel;
    pNome: TPanel;
    pCodigo: TPanel;
    lbCodigo: TLabel;
    edtCodigo: TEdit;
    pCPFCNPJ: TPanel;
    lbCPFCNPJ: TLabel;
    edtCPFCNPJ: TEdit;
    dsGrid: TDataSource;
    pCampos: TPanel;
    pGrid: TPanel;
    edtCodigoCad: TEdit;
    lbCodigoCad: TLabel;
    edtNomeCad: TEdit;
    lbNomeCad: TLabel;
    edtApelido: TEdit;
    lbApelido: TLabel;
    pEndereco: TPanel;
    lbEndereco: TLabel;
    pLbEndereco: TPanel;
    lbCEP: TLabel;
    mskCEP: TMaskEdit;
    ckAtivo: TCheckBox;
    edtLogradouro: TEdit;
    lbLogradouro: TLabel;
    edtNumero: TEdit;
    lbNumero: TLabel;
    lbComplemento: TLabel;
    edtComplemeto: TEdit;
    cbxPais: TDBComboBox;
    lbPais: TLabel;
    cbxEstado: TDBComboBox;
    lbEstado: TLabel;
    cbxMunicipio: TDBComboBox;
    lbMunicipio: TLabel;
    edtBairro: TEdit;
    lbBairro: TLabel;
    edtEmail: TEdit;
    lbEmail: TLabel;
    mskTelefone: TMaskEdit;
    lbTelefone: TLabel;
    cbxSexo: TComboBox;
    lbSexo: TLabel;
    cbxTipoPessoa: TComboBox;
    lbTipoPessoa: TLabel;
    edtInscricaoMunicipal: TEdit;
    lbInscricaoMunicipal: TLabel;
    edtInscricaoEstadual: TEdit;
    lbInscricaoEstadual: TLabel;
    lbCPFCNPJCad: TLabel;
    mskCNPJCPF: TMaskEdit;
    dsPais: TDataSource;
    dsEstado: TDataSource;
    dsMunicipio: TDataSource;
    procedure btnNovoRegistroClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure btnVoltarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure cbxTipoPessoaChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure mskCEPExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dsPaisDataChange(Sender: TObject; Field: TField);
    procedure dsEstadoDataChange(Sender: TObject; Field: TField);
  private
    FMemTable:TFDMemTable;
    FMemPais:TFDMemTable;
    FMemEstado:TFDMemTable;
    FMemMuni:TFDMemTable;
    FInserindo:Boolean;
    FIDRegistro:Int64;
    FCriandoCBX:Boolean;
    ACBrCEP:TACBrCEP;
    CEPAnt:String;

    procedure Validar;

    procedure AjustarTelaCampos(FAbrir:Boolean=True);
    procedure LimparCampos;
    procedure ValidarCNPJ;
    procedure ValidarCPF;
    procedure ValidarEmail;

    procedure PreencherInformacoesRegistro;
    procedure PreencherInformacoesPadroes;
    procedure PreencherMemTables;
    procedure ValidarCamposObrigatorios;
    procedure RetornarRegistrosCbx;

    procedure ConsultaCEPREalizada(Sender:TObject);
  public
    function RemoverCaracteresEspeciais(const Str: string): string;
  end;

var
  frnPrincipal: TfrnPrincipal;

implementation

uses uParametrosJSON,
     uProc;

{$R *.dfm}

procedure TfrnPrincipal.AjustarTelaCampos(FAbrir:Boolean=True);
begin
  LockWindowUpdate(Handle);
  try
    if (FAbrir) then
    begin
      pGrid.Visible := False;
      StatusBar1.Panels.Items[1].Text := 'Registro';
      pCampos.Visible := True;
      btncNovoRegistro.Enabled := False;
      btnFiltrar.Enabled       := False;
      btnVoltar.Enabled        := True;
      btnCancelar.Enabled      := True;
      btnSalvar.Enabled        := True;
    end else
    begin
      pGrid.Visible := True;
      StatusBar1.Panels.Items[1].Text := 'Informa��es Clientes';
      pCampos.Visible := False;
      btncNovoRegistro.Enabled := True;
      btnFiltrar.Enabled       := True;
      btnVoltar.Enabled        := False;
      btnCancelar.Enabled      := False;
      btnSalvar.Enabled        := False;
    end;
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TfrnPrincipal.btnCancelarClick(Sender: TObject);
begin
  if MessageDlg('Deseja cancelar a altera��o?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if (FInserindo) then
    begin
      LimparCampos;
      AjustarTelaCampos(False);
      FMemTable.EmptyDataSet;

      btnFiltrar.Click;
    end else
      PreencherInformacoesRegistro;
  end;
end;

procedure TfrnPrincipal.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja excluir o registro selecionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    var Proc := TProc.Create;
    try
      Proc.Procedimento := 'ExcluirRegistro';
      Proc.TipoAPI      := 'GETResultaJSON';
      Proc.Parametros.Add('ID='+FMemTable.FieldByName('ID').AsString);
      Proc.Execute;

      if (pGrid.Visible) then
        btnFiltrar.Click
      else
      begin
        LimparCampos;
        AjustarTelaCampos(False);
        btnFiltrar.Click;
      end;
    finally
      Proc.Free;
    end;
  end;
end;

procedure TfrnPrincipal.btnFiltrarClick(Sender: TObject);
begin
  var Proc := TProc.Create;
  try
    Proc.Procedimento := 'ConsultaPessoa';
    Proc.Parametros.Add('Codigo='+edtCodigo.Text);
    Proc.Parametros.Add('CPFCNPJ='+RemoverCaracteresEspeciais(edtCPFCNPJ.Text));
    Proc.Parametros.Add('Nome='+edtNome.Text);
    Proc.Execute;

    if (Proc.Stream.Size > 0) then
    begin
      FMemTable.LoadFromStream(Proc.Stream);
      DBGrid1.Refresh;
    end;
  finally
    Proc.Free;
  end;
end;

procedure TfrnPrincipal.btnNovoRegistroClick(Sender: TObject);
begin
  if not (FMemTable.IsEmpty) then
    LimparCampos;
  AjustarTelaCampos;
  PreencherInformacoesPadroes;

  var Proc := TProc.Create;
  try
    Proc.Procedimento := 'ConsultaPessoa';
    Proc.Execute;
    if (Proc.Stream.Size > 0)then
    begin
      FMemTable.LoadFromStream(Proc.Stream);
      FMemTable.EmptyDataSet;
    end;
    FInserindo := True;
  finally
    Proc.Free;
  end;

  RetornarRegistrosCbx;
end;

procedure TfrnPrincipal.btnSalvarClick(Sender: TObject);
begin
  if MessageDlg('Deseja salvar o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Validar;

    PreencherMemTables;

    var Proc := TProc.Create;
    try
      Proc.Procedimento := 'SalvarRegistro';
      Proc.TipoAPI      := 'POSTStream';
      FMemTable.SaveToStream(Proc.Stream);
      Proc.Execute;
    finally
      Proc.Free;
    end;

    FIDRegistro := 0;
    AjustarTelaCampos(False);
    btnFiltrar.Click;
  end;
end;

procedure TfrnPrincipal.btnVoltarClick(Sender: TObject);
begin
  AjustarTelaCampos(False);
  LimparCampos;

  btnFiltrar.Click;
end;

procedure TfrnPrincipal.cbxTipoPessoaChange(Sender: TObject);
begin
  if (cbxTipoPessoa.Text = 'Pessoa F�sica') then
  begin
    lbCPFCNPJCad.Caption := 'CPF';
    mskCNPJCPF.EditMask := '!000.000.000-00;1;_';
  end else
  begin
    lbCPFCNPJCad.Caption := 'CNPJ';
    mskCNPJCPF.EditMask := '!00.000.000/0000-00;1;_';
  end;
end;

procedure TfrnPrincipal.ConsultaCEPREalizada(Sender: TObject);
begin
  if ACBrCEP.Enderecos.Count < 1 then
    ShowMessage('Nenhum Endere�o encontrado')
  else
  begin
    for var I := 0 to ACBrCEP.Enderecos.Count-1 do
    begin
      with ACBrCEP.Enderecos[I] do
      begin
        edtLogradouro.Text := Tipo_Logradouro+ ' ' + Logradouro;
        edtComplemeto.Text := Complemento;
        edtBairro.Text     := Bairro;
        cbxMunicipio.Text  := Municipio;
        cbxEstado.Text     := UF;
      end ;
    end ;
  end ;
end;

constructor TfrnPrincipal.Create(AOwner: TComponent);
begin
  inherited;

  ACBrCEP := TACBrCEP.Create(nil);
  ACBrCEP.WebService := wsViaCep;
  ACBrCEP.OnBuscaEfetuada := ConsultaCEPREalizada;

  FMemTable      := TFDMemTable.Create(nil);
  dsGrid.DataSet := FMemTable;

  FMemPais            := TFDMemTable.Create(nil);
  dsPais.DataSet      := FMemPais;
  FMemEstado          := TFDMemTable.Create(nil);
  dsEstado.DataSet    := FMemEstado;
  FMemMuni            := TFDMemTable.Create(nil);
  dsMunicipio.DataSet := FMemMuni;
end;

procedure TfrnPrincipal.DBGrid1DblClick(Sender: TObject);
begin
  RetornarRegistrosCbx;
  PreencherInformacoesRegistro;
  FMemTable.EmptyDataSet;

  FInserindo := False;
  PreencherMemTables;
  dsPaisDataChange(nil,FMemTable.FieldByName('PAIS'));
  dsEstadoDataChange(nil,FMemTable.FieldByName('ESTADO'));
  cbxEstado.Text := FMemTable.FieldByName('ESTADO').AsString;
  cbxMunicipio.Text := FMemTable.FieldByName('MUNICIPIO').AsString;
  AjustarTelaCampos;
end;

destructor TfrnPrincipal.Destroy;
begin
  ACBrCEP.Free;

  FMemTable.Free;
  FMemPais.Free;
  FMemEstado.Free;
  FMemMuni.Free;

  inherited;
end;

procedure TfrnPrincipal.dsEstadoDataChange(Sender: TObject; Field: TField);
begin
  if not (FCriandoCBX) then
  begin
    FCriandoCBX := True;
    try
      var Proc := TProc.Create;
      try
        Proc.Procedimento := 'RetornaInformacoesTabela';
        Proc.Parametros.Add('Tabela=MUNICIPIOS');
        Proc.Parametros.Add('Estado='+cbxEstado.Text);
        Proc.Execute;
        if (Proc.Stream.Size > 0) then
        begin
          if not (FMemMuni.IsEmpty) then
          begin
            FMemMuni.EmptyDataSet;
            cbxMunicipio.Items.Clear;
          end;
          FMemMuni.LoadFromStream(Proc.Stream);
          cbxMunicipio.DataField := 'NOME';
          FMemMuni.First;
          while not FMemMuni.Eof do
          begin
            cbxMunicipio.Items.Add(FMemMuni.FieldByName('NOME').AsString);
            FMemMuni.Next;
          end;
        end;
      finally
        Proc.Free;
      end;
    finally
      FCriandoCBX := False;
    end;
  end;
end;

procedure TfrnPrincipal.dsPaisDataChange(Sender: TObject; Field: TField);
begin
  if not (FCriandoCBX) then
  begin
    FCriandoCBX := True;
    try
      if (cbxPais.Text <> 'Selecionar...') then
      begin
        var Proc := TProc.Create;
        try
          Proc.Procedimento := 'RetornaInformacoesTabela';
          Proc.Parametros.Add('Tabela=ESTADOS');
          Proc.Parametros.Add('Pais='+cbxPais.Text);
          Proc.Execute;
          if (Proc.Stream.Size > 0)then
          begin
            if not (FMemEstado.IsEmpty) then
            begin
              FMemEstado.EmptyDataSet;
              cbxEstado.Items.Clear;
            end;
            FMemEstado.LoadFromStream(Proc.Stream);
            cbxEstado.DataField := 'SIGLA';
            FMemEstado.First;
            while not FMemEstado.Eof do
            begin
              cbxEstado.Items.Add(FMemEstado.FieldByName('SIGLA').AsString);
              FMemEstado.Next;
            end;
          end;
        finally
          Proc.Free;
        end;
      end;
    finally
      FCriandoCBX := False;
    end;
  end;
end;

procedure TfrnPrincipal.LimparCampos;
begin
  FMemTable.EmptyDataSet;

  CEPAnt := '';
  edtCodigoCad.Clear;
  edtNomeCad.Clear;
  edtApelido.Clear;
  edtLogradouro.Clear;
  edtNumero.Clear;
  edtComplemeto.Clear;
  edtBairro.Clear;
  edtEmail.Clear;
  edtInscricaoMunicipal.Clear;
  edtInscricaoEstadual.Clear;
  mskCEP.Clear;
  mskTelefone.Clear;
  mskCNPJCPF.Clear;
  cbxPais.Clear;
  cbxEstado.Clear;
  cbxMunicipio.Clear;
  cbxSexo.Text := '';
  cbxTipoPessoa.Text := '';
end;

procedure TfrnPrincipal.mskCEPExit(Sender: TObject);
begin
  if (Length(Trim(mskCEP.Text)) = 9) then
  begin
    if (CEPAnt <> mskCEP.Text) then
    begin
      ACBrCEP.BuscarPorCEP(mskCEP.Text);

      CEPAnt := mskCEP.Text;
    end;
  end;
end;

procedure TfrnPrincipal.PreencherInformacoesPadroes;
begin
  ckAtivo.State      := cbChecked;
  cbxSexo.Text       := 'Masculino';
  cbxTipoPessoa.Text := 'Pessoa F�sica';
  var Proc := TProc.Create;
  try
    Proc.Procedimento := 'RetornarNewCodigo';
    Proc.TipoAPI      := 'GETResultaJSON';
    Proc.Execute;

    if (Proc.JSonResultado <> EmptyStr) then
      edtCodigoCad.Text := Proc.JSonResultado;
  finally
    Proc.Free;
  end;
end;

procedure TfrnPrincipal.PreencherInformacoesRegistro;
begin
  CEPAnt := '';

  FIDRegistro        := FMemTable.FieldByName('ID').AsLargeInt;
  edtCodigoCad.Text  := FMemTable.FieldByName('CODIGO').AsString;
  edtNomeCad.Text    := FMemTable.FieldByName('NOME').AsString;
  edtApelido.Text    := FMemTable.FieldByName('APELIDO').AsString;
  edtLogradouro.Text := FMemTable.FieldByName('LOGRADOURO').AsString;
  edtNumero.Text     := FMemTable.FieldByName('NUMERO').AsString;
  edtComplemeto.Text := FMemTable.FieldByName('COMPLEMENTO').AsString;
  edtBairro.Text     := FMemTable.FieldByName('BAIRRO').AsString;
  edtEmail.Text      := FMemTable.FieldByName('EMAIL').AsString;
  mskCEP.Text        := FMemTable.FieldByName('CEP').AsString;
  mskTelefone.Text   := FMemTable.FieldByName('TELEFONE').AsString;
  if (FMemTable.FieldByName('TIPOPESSOA').AsString = 'TF') then
    cbxTipoPessoa.Text := 'Pessoa F�sica'
  else
    cbxTipoPessoa.Text := 'Pessoa Jur�dica';
  cbxTipoPessoaChange(nil);
  mskCNPJCPF.Text    := FMemTable.FieldByName('CPFCNPJ').AsString;
  edtInscricaoMunicipal.Text := FMemTable.FieldByName('INSCRICAOMUNICIPAL').AsString;
  edtInscricaoEstadual.Text  := FMemTable.FieldByName('INSCRICAOESTADUAL').AsString;
  if (FMemTable.FieldByName('ATIVO').AsString = 'S') then
    ckAtivo.State   := cbChecked
  else
    ckAtivo.State   := cbUnchecked;
  cbxPais.Text      := FMemTable.FieldByName('PAIS').AsString;
  cbxEstado.Text    := FMemTable.FieldByName('ESTADO').AsString;
  cbxMunicipio.Text := FMemTable.FieldByName('MUNICIPIO').AsString;
  cbxSexo.Text      := FMemTable.FieldByName('SEXO').AsString;
end;

procedure TfrnPrincipal.PreencherMemTables;
begin
  if (FInserindo) then
  begin
    FMemTable.Insert;
    FInserindo := False;
  end else
  begin
    FMemTable.Edit;
    if not (FMemTable.FieldByName('ID').AsLargeInt > 0) then
      FMemTable.FieldByName('ID').AsLargeInt           := FIDRegistro;
  end;
  FMemTable.FieldByName('CODIGO').AsString             := edtCodigoCad.Text;
  FMemTable.FieldByName('NOME').AsString               := edtNomeCad.Text;
  FMemTable.FieldByName('APELIDO').AsString            := edtApelido.Text;
  FMemTable.FieldByName('LOGRADOURO').AsString         := edtLogradouro.Text;
  FMemTable.FieldByName('NUMERO').AsString             := edtNumero.Text;
  FMemTable.FieldByName('COMPLEMENTO').AsString        := edtComplemeto.Text;
  FMemTable.FieldByName('BAIRRO').AsString             := edtBairro.Text;
  FMemTable.FieldByName('EMAIL').AsString              := edtEmail.Text;
  FMemTable.FieldByName('CEP').AsString                := mskCEP.Text;
  FMemTable.FieldByName('TELEFONE').AsString           := mskTelefone.Text;
  FMemTable.FieldByName('CPFCNPJ').AsString            := mskCNPJCPF.Text;
  FMemTable.FieldByName('INSCRICAOMUNICIPAL').AsString := edtInscricaoMunicipal.Text;
  FMemTable.FieldByName('INSCRICAOESTADUAL').AsString  := edtInscricaoEstadual.Text;
  if (ckAtivo.State = cbChecked) then
    FMemTable.FieldByName('ATIVO').AsString    := 'S'
  else
    FMemTable.FieldByName('ATIVO').AsString    := 'N';
  FMemTable.FieldByName('PAIS').AsString       := cbxPais.Text;
  FMemTable.FieldByName('ESTADO').AsString     := cbxEstado.Text;
  FMemTable.FieldByName('MUNICIPIO').AsString  := cbxMunicipio.Text;
  FMemTable.FieldByName('SEXO').AsString       := cbxSexo.Text;
  if (cbxTipoPessoa.Text = 'Pessoa F�sica') then
    FMemTable.FieldByName('TIPOPESSOA').AsString := 'TF'
  else
    FMemTable.FieldByName('TIPOPESSOA').AsString := 'TJ';
  FMemTable.Post;
end;

function TfrnPrincipal.RemoverCaracteresEspeciais(const Str: string): string;
begin
  Result := '';
  for var I := 1 to Length(Str) do
  begin
    // Verifica se o caractere atual n�o � um caractere especial
    if not (Str[I] in ['/', '-', '.', '_']) then
      Result := Result + Str[I];
  end;
end;

procedure TfrnPrincipal.RetornarRegistrosCbx;
begin
  FCriandoCBX := True;
  try
    var Proc := TProc.Create;
    try
      Proc.Procedimento := 'RetornaInformacoesTabela';
      Proc.Parametros.Add('Tabela=PAISES');
      Proc.Execute;
      if (Proc.Stream.Size > 0) then
      begin
        if not (FMemPais.IsEmpty) then
        begin
          FMemPais.EmptyDataSet;
          cbxPais.Items.Clear;
        end;
        FMemPais.LoadFromStream(Proc.Stream);
        cbxPais.DataField := 'NOME';
        FMemPais.First;
        while not FMemPais.Eof do
        begin
          cbxPais.Items.Add(FMemPais.FieldByName('NOME').AsString);
          FMemPais.Next;
        end;
      end;
      cbxPais.Text      := 'Selecionar...';
      cbxEstado.Text    := 'Selecionar...';
      cbxMunicipio.Text := 'Selecionar...';
    finally
      Proc.Free;
    end;
  finally
    FCriandoCBX := False;
  end;
end;

procedure TfrnPrincipal.Validar;
begin
  ValidarCamposObrigatorios;

  if (cbxTipoPessoa.Text = 'Pessoa F�sica') then
    ValidarCPF
  else
    ValidarCNPJ;

  if (edtEmail.Text <> EmptyStr) then
    ValidarEmail;
end;

procedure TfrnPrincipal.ValidarCamposObrigatorios;
begin
  if (edtCodigoCad.Text = EmptyStr) then
  begin
    edtCodigoCad.SetFocus;
    raise Exception.Create('Faltou informar o c�digo!');
  end;

  if (edtNomeCad.Text = EmptyStr) then
  begin
    edtNomeCad.SetFocus;
    raise Exception.Create('Faltou informar o nome!');
  end;

  if (ckAtivo.State = cbGrayed) then
  begin
    raise Exception.Create('Faltou informar o status!');
    ckAtivo.SetFocus;
  end;

  if (cbxPais.Text = EmptyStr) or (cbxPais.Text = 'Selecionar...') then
  begin
    cbxPais.SetFocus;
    raise Exception.Create('Faltou informar o pa�s!');
  end;

  if (cbxEstado.Text = EmptyStr) or (cbxEstado.Text = 'Selecionar...') then
  begin
    cbxEstado.SetFocus;
    raise Exception.Create('Faltou informar o estado!');
  end;

  if (cbxMunicipio.Text = EmptyStr) or (cbxMunicipio.Text = 'Selecionar...') then
  begin
    cbxMunicipio.SetFocus;
    raise Exception.Create('Faltou informar o munic�pio!');
  end;

  if (cbxTipoPessoa.Text = EmptyStr) then
  begin
    cbxTipoPessoa.SetFocus;
    raise Exception.Create('Faltou informar o tipo da pessoa!');
  end;

  if (cbxSexo.Text = EmptyStr) then
  begin
    cbxSexo.SetFocus;
    raise Exception.Create('Faltou informar o sexo!');
  end;

  if (RemoverCaracteresEspeciais(mskCNPJCPF.Text) = EmptyStr) then
  begin
    mskCNPJCPF.SetFocus;
    raise Exception.Create('Faltou informar o CPF/CNPJ!');
  end;
end;

procedure TfrnPrincipal.ValidarCNPJ;
var Soma, Resto, DigitoVerif1, DigitoVerif2, i: Integer;
    CNPJArray: array of Integer;
begin
  if Length(mskCNPJCPF.Text) <> 14 then
      Exit;

    SetLength(CNPJArray, 14);
    for i := 0 to 13 do
      CNPJArray[i] := StrToIntDef(mskCNPJCPF.Text[i + 1], -1);

    // C�lculo do primeiro d�gito verificador
    Soma := 0;
    Soma := Soma + CNPJArray[0] * 5;
    Soma := Soma + CNPJArray[1] * 4;
    Soma := Soma + CNPJArray[2] * 3;
    Soma := Soma + CNPJArray[3] * 2;
    Soma := Soma + CNPJArray[4] * 9;
    Soma := Soma + CNPJArray[5] * 8;
    Soma := Soma + CNPJArray[6] * 7;
    Soma := Soma + CNPJArray[7] * 6;
    Soma := Soma + CNPJArray[8] * 5;
    Soma := Soma + CNPJArray[9] * 4;
    Soma := Soma + CNPJArray[10] * 3;
    Soma := Soma + CNPJArray[11] * 2;

    Resto := Soma mod 11;
    if Resto < 2 then
      DigitoVerif1 := 0
    else
      DigitoVerif1 := 11 - Resto;

    // C�lculo do segundo d�gito verificador
    Soma := 0;
    Soma := Soma + CNPJArray[0] * 6;
    Soma := Soma + CNPJArray[1] * 5;
    Soma := Soma + CNPJArray[2] * 4;
    Soma := Soma + CNPJArray[3] * 3;
    Soma := Soma + CNPJArray[4] * 2;
    Soma := Soma + CNPJArray[5] * 9;
    Soma := Soma + CNPJArray[6] * 8;
    Soma := Soma + CNPJArray[7] * 7;
    Soma := Soma + CNPJArray[8] * 6;
    Soma := Soma + CNPJArray[9] * 5;
    Soma := Soma + CNPJArray[10] * 4;
    Soma := Soma + CNPJArray[11] * 3;
    Soma := Soma + CNPJArray[12] * 2;
    Soma := Soma + CNPJArray[13] * 1;

    Resto := Soma mod 11;
    if Resto < 2 then
      DigitoVerif2 := 0
    else
      DigitoVerif2 := 11 - Resto;

    if not ((CNPJArray[12] = DigitoVerif1) and (CNPJArray[13] = DigitoVerif2)) then
    begin
      mskCNPJCPF.SetFocus;
      raise Exception.Create('CNPJ Informa est� inv�lido');
    end;
end;

procedure TfrnPrincipal.ValidarCPF;
var Soma, Resto, DigitoVerif1, DigitoVerif2, i: Integer;
    CPFArray: array of Integer;
begin
  if Length(mskCNPJCPF.Text) <> 11 then
      Exit;

  SetLength(CPFArray, 11);
  for i := 0 to 10 do
    CPFArray[i] := StrToIntDef(mskCNPJCPF.Text[i + 1], -1);

  Soma := 0;
  for i := 0 to 8 do
    Soma := Soma + CPFArray[i] * (10 - i);

  Resto := Soma mod 11;
  if Resto < 2 then
    DigitoVerif1 := 0
  else
    DigitoVerif1 := 11 - Resto;

  Soma := 0;
  for i := 0 to 8 do
    Soma := Soma + CPFArray[i] * (11 - i);

  Soma := Soma + DigitoVerif1 * 2;
  Resto := Soma mod 11;
  if Resto < 2 then
    DigitoVerif2 := 0
  else
    DigitoVerif2 := 11 - Resto;

  if not ((CPFArray[9] = DigitoVerif1) and (CPFArray[10] = DigitoVerif2)) then
  begin
    mskCNPJCPF.SetFocus;
    raise Exception.Create('CPF Informa est� inv�lido');
  end;
end;

procedure TfrnPrincipal.ValidarEmail;
begin
  if (edtEmail.Text <> EmptyStr) then
  begin
    var AtPos := Pos('@', edtEmail.Text);
    var DotPos := LastDelimiter('.', edtEmail.Text);
    if not ((AtPos > 0) and (DotPos > AtPos) and (DotPos < Length(edtEmail.Text))) then
    begin
      edtEmail.SetFocus;
      raise Exception.Create('E-Mail informado inv�lido');
    end;
  end;
end;

end.
