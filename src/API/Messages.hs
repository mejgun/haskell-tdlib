-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Messages where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Message as Message

data Messages = 
 Messages { messages :: Maybe [Message.Message], total_count :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON Messages where
 toJSON (Messages { messages = messages, total_count = total_count }) =
  A.object [ "@type" A..= T.String "messages", "messages" A..= messages, "total_count" A..= total_count ]

instance T.FromJSON Messages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "messages" -> parseMessages v
   _ -> mempty
  where
   parseMessages :: A.Value -> T.Parser Messages
   parseMessages = A.withObject "Messages" $ \o -> do
    messages <- optional $ o A..: "messages"
    total_count <- optional $ o A..: "total_count"
    return $ Messages { messages = messages, total_count = total_count }