-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteMessages where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data DeleteMessages = 
 DeleteMessages { revoke :: Maybe Bool, message_ids :: Maybe [Int], chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON DeleteMessages where
 toJSON (DeleteMessages { revoke = revoke, message_ids = message_ids, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "deleteMessages", "revoke" A..= revoke, "message_ids" A..= message_ids, "chat_id" A..= chat_id ]

instance T.FromJSON DeleteMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deleteMessages" -> parseDeleteMessages v
   _ -> mempty
  where
   parseDeleteMessages :: A.Value -> T.Parser DeleteMessages
   parseDeleteMessages = A.withObject "DeleteMessages" $ \o -> do
    revoke <- optional $ o A..: "revoke"
    message_ids <- optional $ o A..: "message_ids"
    chat_id <- optional $ o A..: "chat_id"
    return $ DeleteMessages { revoke = revoke, message_ids = message_ids, chat_id = chat_id }