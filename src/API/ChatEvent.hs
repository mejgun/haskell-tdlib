-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatEvent where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatEventAction as ChatEventAction

data ChatEvent = 
 ChatEvent { action :: Maybe ChatEventAction.ChatEventAction, user_id :: Maybe Int, date :: Maybe Int, _id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON ChatEvent where
 toJSON (ChatEvent { action = action, user_id = user_id, date = date, _id = _id }) =
  A.object [ "@type" A..= T.String "chatEvent", "action" A..= action, "user_id" A..= user_id, "date" A..= date, "id" A..= _id ]

instance T.FromJSON ChatEvent where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatEvent" -> parseChatEvent v
   _ -> mempty
  where
   parseChatEvent :: A.Value -> T.Parser ChatEvent
   parseChatEvent = A.withObject "ChatEvent" $ \o -> do
    action <- optional $ o A..: "action"
    user_id <- optional $ o A..: "user_id"
    date <- optional $ o A..: "date"
    _id <- optional $ o A..: "id"
    return $ ChatEvent { action = action, user_id = user_id, date = date, _id = _id }