-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessageForwardInfo where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.MessageForwardOrigin as MessageForwardOrigin

data MessageForwardInfo = 
 MessageForwardInfo { from_message_id :: Maybe Int, from_chat_id :: Maybe Int, date :: Maybe Int, origin :: Maybe MessageForwardOrigin.MessageForwardOrigin }  deriving (Show, Eq)

instance T.ToJSON MessageForwardInfo where
 toJSON (MessageForwardInfo { from_message_id = from_message_id, from_chat_id = from_chat_id, date = date, origin = origin }) =
  A.object [ "@type" A..= T.String "messageForwardInfo", "from_message_id" A..= from_message_id, "from_chat_id" A..= from_chat_id, "date" A..= date, "origin" A..= origin ]

instance T.FromJSON MessageForwardInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "messageForwardInfo" -> parseMessageForwardInfo v
   _ -> mempty
  where
   parseMessageForwardInfo :: A.Value -> T.Parser MessageForwardInfo
   parseMessageForwardInfo = A.withObject "MessageForwardInfo" $ \o -> do
    from_message_id <- optional $ o A..: "from_message_id"
    from_chat_id <- optional $ o A..: "from_chat_id"
    date <- optional $ o A..: "date"
    origin <- optional $ o A..: "origin"
    return $ MessageForwardInfo { from_message_id = from_message_id, from_chat_id = from_chat_id, date = date, origin = origin }