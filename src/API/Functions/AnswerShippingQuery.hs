-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AnswerShippingQuery where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ShippingOption as ShippingOption

data AnswerShippingQuery = 
 AnswerShippingQuery { error_message :: Maybe String, shipping_options :: Maybe [ShippingOption.ShippingOption], shipping_query_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON AnswerShippingQuery where
 toJSON (AnswerShippingQuery { error_message = error_message, shipping_options = shipping_options, shipping_query_id = shipping_query_id }) =
  A.object [ "@type" A..= T.String "answerShippingQuery", "error_message" A..= error_message, "shipping_options" A..= shipping_options, "shipping_query_id" A..= shipping_query_id ]

instance T.FromJSON AnswerShippingQuery where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "answerShippingQuery" -> parseAnswerShippingQuery v
   _ -> mempty
  where
   parseAnswerShippingQuery :: A.Value -> T.Parser AnswerShippingQuery
   parseAnswerShippingQuery = A.withObject "AnswerShippingQuery" $ \o -> do
    error_message <- o A..:? "error_message"
    shipping_options <- o A..:? "shipping_options"
    shipping_query_id <- mconcat [ o A..:? "shipping_query_id", readMaybe <$> (o A..: "shipping_query_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ AnswerShippingQuery { error_message = error_message, shipping_options = shipping_options, shipping_query_id = shipping_query_id }