-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AnswerPreCheckoutQuery where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data AnswerPreCheckoutQuery = 
 AnswerPreCheckoutQuery { error_message :: Maybe String, pre_checkout_query_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON AnswerPreCheckoutQuery where
 toJSON (AnswerPreCheckoutQuery { error_message = error_message, pre_checkout_query_id = pre_checkout_query_id }) =
  A.object [ "@type" A..= T.String "answerPreCheckoutQuery", "error_message" A..= error_message, "pre_checkout_query_id" A..= pre_checkout_query_id ]

instance T.FromJSON AnswerPreCheckoutQuery where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "answerPreCheckoutQuery" -> parseAnswerPreCheckoutQuery v
   _ -> mempty
  where
   parseAnswerPreCheckoutQuery :: A.Value -> T.Parser AnswerPreCheckoutQuery
   parseAnswerPreCheckoutQuery = A.withObject "AnswerPreCheckoutQuery" $ \o -> do
    error_message <- optional $ o A..: "error_message"
    pre_checkout_query_id <- optional $ o A..: "pre_checkout_query_id"
    return $ AnswerPreCheckoutQuery { error_message = error_message, pre_checkout_query_id = pre_checkout_query_id }