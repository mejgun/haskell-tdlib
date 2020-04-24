-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ViewMessages where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data ViewMessages = 
 ViewMessages { force_read :: Maybe Bool, message_ids :: Maybe [Int], chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON ViewMessages where
 toJSON (ViewMessages { force_read = force_read, message_ids = message_ids, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "viewMessages", "force_read" A..= force_read, "message_ids" A..= message_ids, "chat_id" A..= chat_id ]

instance T.FromJSON ViewMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "viewMessages" -> parseViewMessages v
   _ -> mempty
  where
   parseViewMessages :: A.Value -> T.Parser ViewMessages
   parseViewMessages = A.withObject "ViewMessages" $ \o -> do
    force_read <- optional $ o A..: "force_read"
    message_ids <- optional $ o A..: "message_ids"
    chat_id <- optional $ o A..: "chat_id"
    return $ ViewMessages { force_read = force_read, message_ids = message_ids, chat_id = chat_id }