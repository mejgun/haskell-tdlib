-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AnswerCustomQuery where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

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
    _data <- optional $ o A..: "data"
    custom_query_id <- optional $ o A..: "custom_query_id"
    return $ AnswerCustomQuery { _data = _data, custom_query_id = custom_query_id }