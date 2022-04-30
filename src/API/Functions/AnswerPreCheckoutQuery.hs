-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AnswerPreCheckoutQuery where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Sets the result of a pre-checkout query; for bots only 
-- 
-- __pre_checkout_query_id__ Identifier of the pre-checkout query
-- 
-- __error_message__ An error message, empty on success
data AnswerPreCheckoutQuery = 

 AnswerPreCheckoutQuery { error_message :: Maybe String, pre_checkout_query_id :: Maybe Int }  deriving (Eq)

instance Show AnswerPreCheckoutQuery where
 show AnswerPreCheckoutQuery { error_message=error_message, pre_checkout_query_id=pre_checkout_query_id } =
  "AnswerPreCheckoutQuery" ++ U.cc [U.p "error_message" error_message, U.p "pre_checkout_query_id" pre_checkout_query_id ]

instance T.ToJSON AnswerPreCheckoutQuery where
 toJSON AnswerPreCheckoutQuery { error_message = error_message, pre_checkout_query_id = pre_checkout_query_id } =
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
    error_message <- o A..:? "error_message"
    pre_checkout_query_id <- mconcat [ o A..:? "pre_checkout_query_id", readMaybe <$> (o A..: "pre_checkout_query_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ AnswerPreCheckoutQuery { error_message = error_message, pre_checkout_query_id = pre_checkout_query_id }
 parseJSON _ = mempty
