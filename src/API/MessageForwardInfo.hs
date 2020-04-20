-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessageForwardInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.MessageForwardOrigin as MessageForwardOrigin

--main = putStrLn "ok"

data MessageForwardInfo = 
 MessageForwardInfo { from_message_id :: Int, from_chat_id :: Int, date :: Int, origin :: MessageForwardOrigin.MessageForwardOrigin }  -- deriving (Show)

instance T.ToJSON MessageForwardInfo where
 toJSON (MessageForwardInfo { from_message_id = from_message_id, from_chat_id = from_chat_id, date = date, origin = origin }) =
  A.object [ "@type" A..= T.String "messageForwardInfo", "from_message_id" A..= from_message_id, "from_chat_id" A..= from_chat_id, "date" A..= date, "origin" A..= origin ]
-- messageForwardInfo MessageForwardInfo  { from_message_id :: Int, from_chat_id :: Int, date :: Int, origin :: MessageForwardOrigin.MessageForwardOrigin } 



instance T.FromJSON MessageForwardInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "messageForwardInfo" -> parseMessageForwardInfo v
  where
   parseMessageForwardInfo :: A.Value -> T.Parser MessageForwardInfo
   parseMessageForwardInfo = A.withObject "MessageForwardInfo" $ \o -> do
    from_message_id <- o A..: "from_message_id"
    from_chat_id <- o A..: "from_chat_id"
    date <- o A..: "date"
    origin <- o A..: "origin"
    return $ MessageForwardInfo { from_message_id = from_message_id, from_chat_id = from_chat_id, date = date, origin = origin }