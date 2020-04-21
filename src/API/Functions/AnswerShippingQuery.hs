-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AnswerShippingQuery where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ShippingOption as ShippingOption

--main = putStrLn "ok"

data AnswerShippingQuery = 
 AnswerShippingQuery { error_message :: String, shipping_options :: [ShippingOption.ShippingOption], shipping_query_id :: Int }  deriving (Show)

instance T.ToJSON AnswerShippingQuery where
 toJSON (AnswerShippingQuery { error_message = error_message, shipping_options = shipping_options, shipping_query_id = shipping_query_id }) =
  A.object [ "@type" A..= T.String "answerShippingQuery", "error_message" A..= error_message, "shipping_options" A..= shipping_options, "shipping_query_id" A..= shipping_query_id ]



instance T.FromJSON AnswerShippingQuery where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "answerShippingQuery" -> parseAnswerShippingQuery v

   _ -> mempty ""
  where
   parseAnswerShippingQuery :: A.Value -> T.Parser AnswerShippingQuery
   parseAnswerShippingQuery = A.withObject "AnswerShippingQuery" $ \o -> do
    error_message <- o A..: "error_message"
    shipping_options <- o A..: "shipping_options"
    shipping_query_id <- o A..: "shipping_query_id"
    return $ AnswerShippingQuery { error_message = error_message, shipping_options = shipping_options, shipping_query_id = shipping_query_id }