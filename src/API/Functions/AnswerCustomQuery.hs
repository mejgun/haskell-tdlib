-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AnswerCustomQuery where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Answers a custom query; for bots only 
-- 
-- __custom_query_id__ Identifier of a custom query
-- 
-- __data__ JSON-serialized answer to the query
data AnswerCustomQuery = 

 AnswerCustomQuery { _data :: Maybe String, custom_query_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON AnswerCustomQuery where
 toJSON (AnswerCustomQuery { _data = _data, custom_query_id = custom_query_id }) =
  A.object [ "@type" A..= T.String "answerCustomQuery", "data" A..= _data, "custom_query_id" A..= custom_query_id ]

instance T.FromJSON AnswerCustomQuery where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "answerCustomQuery" -> parseAnswerCustomQuery v
   _ -> mempty
  where
   parseAnswerCustomQuery :: A.Value -> T.Parser AnswerCustomQuery
   parseAnswerCustomQuery = A.withObject "AnswerCustomQuery" $ \o -> do
    _data <- o A..:? "data"
    custom_query_id <- mconcat [ o A..:? "custom_query_id", readMaybe <$> (o A..: "custom_query_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ AnswerCustomQuery { _data = _data, custom_query_id = custom_query_id }