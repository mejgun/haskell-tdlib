-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatEvents where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.ChatEvent as ChatEvent

-- |
-- 
-- Contains a list of chat events 
-- 
-- __events__ List of events
data ChatEvents = 

 ChatEvents { events :: Maybe [ChatEvent.ChatEvent] }  deriving (Eq)

instance Show ChatEvents where
 show ChatEvents { events=events } =
  "ChatEvents" ++ cc [p "events" events ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ChatEvents where
 toJSON ChatEvents { events = events } =
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
 parseJSON _ = mempty
