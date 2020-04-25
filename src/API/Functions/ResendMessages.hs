-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResendMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data ResendMessages = 
 ResendMessages { message_ids :: Maybe [Int], chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON ResendMessages where
 toJSON (ResendMessages { message_ids = message_ids, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "resendMessages", "message_ids" A..= message_ids, "chat_id" A..= chat_id ]

instance T.FromJSON ResendMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "resendMessages" -> parseResendMessages v
   _ -> mempty
  where
   parseResendMessages :: A.Value -> T.Parser ResendMessages
   parseResendMessages = A.withObject "ResendMessages" $ \o -> do
    message_ids <- o A..:? "message_ids"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ResendMessages { message_ids = message_ids, chat_id = chat_id }