-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatNearby where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ChatNearby = 
 ChatNearby { distance :: Int, chat_id :: Int }  deriving (Show)

instance T.ToJSON ChatNearby where
 toJSON (ChatNearby { distance = distance, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "chatNearby", "distance" A..= distance, "chat_id" A..= chat_id ]



instance T.FromJSON ChatNearby where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatNearby" -> parseChatNearby v

   _ -> mempty ""
  where
   parseChatNearby :: A.Value -> T.Parser ChatNearby
   parseChatNearby = A.withObject "ChatNearby" $ \o -> do
    distance <- o A..: "distance"
    chat_id <- o A..: "chat_id"
    return $ ChatNearby { distance = distance, chat_id = chat_id }