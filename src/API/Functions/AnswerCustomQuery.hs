-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AnswerCustomQuery where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data AnswerCustomQuery = 
 AnswerCustomQuery { _data :: String, custom_query_id :: Int }  deriving (Show)

instance T.ToJSON AnswerCustomQuery where
 toJSON (AnswerCustomQuery { _data = _data, custom_query_id = custom_query_id }) =
  A.object [ "@type" A..= T.String "answerCustomQuery", "data" A..= _data, "custom_query_id" A..= custom_query_id ]



instance T.FromJSON AnswerCustomQuery where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "answerCustomQuery" -> parseAnswerCustomQuery v

   _ -> mempty ""
  where
   parseAnswerCustomQuery :: A.Value -> T.Parser AnswerCustomQuery
   parseAnswerCustomQuery = A.withObject "AnswerCustomQuery" $ \o -> do
    _data <- o A..: "data"
    custom_query_id <- o A..: "custom_query_id"
    return $ AnswerCustomQuery { _data = _data, custom_query_id = custom_query_id }