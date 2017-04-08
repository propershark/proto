def rpc_id_for rpc
  "#{rpc['id']}"
end

def sample_id_for rpc, sample_name
  "#{rpc['id']}_#{sample_name.gsub(/\W/, '-')}"
end
