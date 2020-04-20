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

