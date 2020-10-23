#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Country.all.empty?

  Country.create(name: 'Brasil', acronym: 'BR', code: '1058') if Country.all.empty?
  countrie = Country.first

  if State.all.empty?
    State.create([
                     {country: countrie, name: 'Acre', acronym: 'AC', code: '12'},{country: countrie, name: 'Alagoas', acronym: 'AL', code: '27'},{country: countrie, name: 'Amazonas', acronym: 'AM', code: '13'},
                     {country: countrie, name: 'Amapá', acronym: 'AP', code: '16'},{country: countrie, name: 'Bahia', acronym: 'BA', code: '29'},{country: countrie, name: 'Ceará', acronym: 'CE', code: '23'},
                     {country: countrie, name: 'Distrito Federal', acronym: 'DF', code: '53'},{country: countrie, name: 'Espírito Santo', acronym: 'ES', code: '32'},{country: countrie, name: 'Goiás', acronym: 'GO', code: '52'},
                     {country: countrie, name: 'Maranhão', acronym: 'MA', code: '21'},{country: countrie, name: 'Minas Gerais', acronym: 'MG', code: '31'},{country: countrie, name: 'Mato Grosso do Sul', acronym: 'MS', code: '50'},
                     {country: countrie, name: 'Mato Grosso', acronym: 'MT', code: '51'},{country: countrie, name: 'Pará', acronym: 'PA', code: '15'},{country: countrie, name: 'Paraíba', acronym: 'PB', code: '25'},
                     {country: countrie, name: 'Pernambuco', acronym: 'PE', code: '26'},{country: countrie, name: 'Piauí', acronym: 'PI', code: '22'},{country: countrie, name: 'Paraná', acronym: 'PR', code: '41'},
                     {country: countrie, name: 'Rio de Janeiro', acronym: 'RJ', code: '33'},{country: countrie, name: 'Rio Grande do Norte', acronym: 'RN', code: '24'},{country: countrie, name: 'Rondônia', acronym: 'RO', code: '11'},
                     {country: countrie, name: 'Roraima', acronym: 'RR', code: '14'},{country: countrie, name: 'Rio Grande do Sul', acronym: 'RS', code: '43'},{country: countrie, name: 'Santa Catarina', acronym: 'SC', code: '42'},
                     {country: countrie, name: 'Sergipe', acronym: 'SE', code: '28'},{country: countrie, name: 'São Paulo', acronym: 'SP', code: '35'},{country: countrie, name: 'Tocantins', acronym: 'TO', code: '17'}
                 ])
  end

  if City.first.nil?
    #id_cidade;cidade;cidade_sem_acento;estado;cidade_ibge;ddd;cidade_area;latitude;longitude
    File.readlines("#{Rails.root}/public/populabanco/tbl_cep_cidade.txt").each do |linha|
      registro = linha.split(";")
      City.create!(state_id: State.find_by(acronym: registro[3].lstrip.rstrip).id, name: registro[2].lstrip.rstrip, code: registro[4].lstrip.rstrip, ddd: registro[5].lstrip.rstrip, area: registro[6].lstrip.rstrip, latitude: registro[7].lstrip.rstrip, longitude: registro[8].lstrip.rstrip, ref: registro[0].lstrip.rstrip)
    end
  end

  if Bairro.first.nil?
    #id_bairro;bairro;bairro_sem_acento;cidade_id;estado;latitude;longitude
    File.readlines("#{Rails.root}/public/populabanco/tbl_cep_bairro.txt").each do |linha|
      registro = linha.split(";")
      Bairro.create!(city_id: City.find_by(ref: registro[3].lstrip.rstrip).id, ref: registro[0].lstrip.rstrip, descricao: registro[2].lstrip.rstrip, latitude: registro[5].lstrip.rstrip, longitude: registro[6].lstrip.rstrip)
    end
  end

  if Cep.first.nil?
    #cep;tipo;nome_logradouro;logradouro;bairro_id;cidade_id;estado;tipo_sem_acento;nome_logradouro_sem_acento;logradouro_sem_acento;latitude;longitude;cep_ativo
    File.readlines("#{Rails.root}/public/populabanco/tbl_cep_n_log_part01.txt").each do |linha|
      registro = linha.split(";")
      Cep.create!(bairro_id: Bairro.find_by(ref: registro[4].lstrip.rstrip).id, ref: registro[4].lstrip.rstrip, cep: registro[0].lstrip.rstrip, tipo: registro[1].lstrip.rstrip, logradouro: registro[9].lstrip.rstrip, latitude: registro[10].lstrip.rstrip,longitude: registro[11].lstrip.rstrip, ativo: registro[12].lstrip.rstrip == 'S' ? true : false )
    end

    File.readlines("#{Rails.root}/public/populabanco/tbl_cep_n_log_part02.txt").each do |linha|
      registro = linha.split(";")
      Cep.create!(bairro_id: Bairro.find_by(ref: registro[4].lstrip.rstrip).id, ref: registro[4].lstrip.rstrip, cep: registro[0].lstrip.rstrip, tipo: registro[1].lstrip.rstrip, logradouro: registro[9].lstrip.rstrip, latitude: registro[10].lstrip.rstrip,longitude: registro[11].lstrip.rstrip, ativo: registro[12].lstrip.rstrip == 'S' ? true : false )
    end
  end

  Group.create(name: 'Developer')

end