-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatEvents where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatEvent as ChatEvent

--main = putStrLn "ok"

data ChatEvents = 
 ChatEvents { events :: [ChatEvent.ChatEvent] }  -- deriving (Show)

instance T.ToJSON ChatEvents where
 toJSON (ChatEvents { events = events }) =
  A.object [ "@type" A..= T.String "chatEvents", "events" A..= events ]
-- chatEvents ChatEvents  { events :: [ChatEvent.ChatEvent] } 



instance T.FromJSON ChatEvents where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatEvents" -> parseChatEvents v
  where
   parseChatEvents :: A.Value -> T.Parser ChatEvents
   parseChatEvents = A.withObject "ChatEvents" $ \o -> do
    events <- o A..: "events"
    return $ ChatEvents { events = events }