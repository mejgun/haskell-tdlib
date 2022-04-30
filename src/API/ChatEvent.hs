-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatEvent where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.ChatEventAction as ChatEventAction
import {-# SOURCE #-} qualified API.MessageSender as MessageSender

-- |
-- 
-- Represents a chat event 
-- 
-- __id__ Chat event identifier
-- 
-- __date__ Point in time (Unix timestamp) when the event happened
-- 
-- __member_id__ Identifier of the user or chat who performed the action
-- 
-- __action__ The action
data ChatEvent = 

 ChatEvent { action :: Maybe ChatEventAction.ChatEventAction, member_id :: Maybe MessageSender.MessageSender, date :: Maybe Int, _id :: Maybe Int }  deriving (Eq)

instance Show ChatEvent where
 show ChatEvent { action=action, member_id=member_id, date=date, _id=_id } =
  "ChatEvent" ++ U.cc [U.p "action" action, U.p "member_id" member_id, U.p "date" date, U.p "_id" _id ]

instance T.ToJSON ChatEvent where
 toJSON ChatEvent { action = action, member_id = member_id, date = date, _id = _id } =
  A.object [ "@type" A..= T.String "chatEvent", "action" A..= action, "member_id" A..= member_id, "date" A..= date, "id" A..= _id ]

instance T.FromJSON ChatEvent where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatEvent" -> parseChatEvent v
   _ -> mempty
  where
   parseChatEvent :: A.Value -> T.Parser ChatEvent
   parseChatEvent = A.withObject "ChatEvent" $ \o -> do
    action <- o A..:? "action"
    member_id <- o A..:? "member_id"
    date <- mconcat [ o A..:? "date", readMaybe <$> (o A..: "date" :: T.Parser String)] :: T.Parser (Maybe Int)
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatEvent { action = action, member_id = member_id, date = date, _id = _id }
 parseJSON _ = mempty
