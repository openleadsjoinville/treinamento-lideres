// Configuração compartilhada (deck + página do participante).
// IMPORTANTE: aqui só vai a chave ANON (pública). NUNCA coloque a service_role aqui.
window.APP_CONFIG = {
  SUPABASE_URL: "https://wanpmexubwgvxxmlhnlx.supabase.co",
  SUPABASE_ANON_KEY: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndhbnBtZXh1Yndndnh4bWxobmx4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODI1Mjk1NzMsImV4cCI6MjA5ODEwNTU3M30.bO4bUK3wsE-OqjN0HmlthD6l2KHvsirH9nfBF7qTaWw",

  // Perguntas. Ordem do array = question_id 1, 2, 3, …
  // 1-3: bloco "exemplo / liderança".  4-6: bloco "arrependimento / Davi".
  QUESTIONS: [
    "Em que área você já deveria ser exemplo, mas ainda age como quem precisa ser carregado?",
    "Sua liderança inspira outros adolescentes a levarem Cristo mais a sério?",
    "Quem convive com você diria que sua fé aparece no jeito como você fala, reage e trata pessoas?",
    "Quando você erra, sua primeira reação é confessar ou se justificar?",
    "Você tem alguém que pode confrontar você?",
    "Existe algum pecado que você está protegendo com desculpas?"
  ]
};
