-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AnswerPreCheckoutQuery where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data AnswerPreCheckoutQuery = 
 AnswerPreCheckoutQuery { error_message :: String, pre_checkout_query_id :: Int }  deriving (Show)

instance T.ToJSON AnswerPreCheckoutQuery where
 toJSON (AnswerPreCheckoutQuery { error_message = error_message, pre_checkout_query_id = pre_checkout_query_id }) =
  A.object [ "@type" A..= T.String "answerPreCheckoutQuery", "error_message" A..= error_message, "pre_checkout_query_id" A..= pre_checkout_query_id ]



instance T.FromJSON AnswerPreCheckoutQuery where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "answerPreCheckoutQuery" -> parseAnswerPreCheckoutQuery v

   _ -> mempty ""
  where
   parseAnswerPreCheckoutQuery :: A.Value -> T.Parser AnswerPreCheckoutQuery
   parseAnswerPreCheckoutQuery = A.withObject "AnswerPreCheckoutQuery" $ \o -> do
    error_message <- o A..: "error_message"
    pre_checkout_query_id <- o A..: "pre_checkout_query_id"
    return $ AnswerPreCheckoutQuery { error_message = error_message, pre_checkout_query_id = pre_checkout_query_id }