-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatEvents where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatEvent as ChatEvent

-- |
-- 
-- Contains a list of chat events 
-- 
-- __events__ List of events
data ChatEvents = 

 ChatEvents { events :: Maybe [ChatEvent.ChatEvent] }  deriving (Show, Eq)

instance T.ToJSON ChatEvents where
 toJSON (ChatEvents { events = events }) =
  A.object [ "@type" A..= T.String "chatEvents", "events" A..= events ]

instance T.FromJSON ChatEvents where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatEvents" -> parseChatEvents v
   _ -> mempty
  where
   parseChatEvents :: A.Value -> T.Parser ChatEvents
   parseChatEvents = A.withObject "ChatEvents" $ \o -> do
    events <- o A..:? "events"
    return $ ChatEvents { events = events }