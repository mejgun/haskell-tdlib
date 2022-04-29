-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.UnreadReaction where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.MessageSender as MessageSender

-- |
-- 
-- Contains information about an unread reaction to a message
-- 
-- __reaction__ Text representation of the reaction
-- 
-- __sender_id__ Identifier of the sender, added the reaction
-- 
-- __is_big__ True, if the reaction was added with a big animation
data UnreadReaction = 

 UnreadReaction { is_big :: Maybe Bool, sender_id :: Maybe MessageSender.MessageSender, reaction :: Maybe String }  deriving (Eq)

instance Show UnreadReaction where
 show UnreadReaction { is_big=is_big, sender_id=sender_id, reaction=reaction } =
  "UnreadReaction" ++ cc [p "is_big" is_big, p "sender_id" sender_id, p "reaction" reaction ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON UnreadReaction where
 toJSON UnreadReaction { is_big = is_big, sender_id = sender_id, reaction = reaction } =
  A.object [ "@type" A..= T.String "unreadReaction", "is_big" A..= is_big, "sender_id" A..= sender_id, "reaction" A..= reaction ]

instance T.FromJSON UnreadReaction where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "unreadReaction" -> parseUnreadReaction v
   _ -> mempty
  where
   parseUnreadReaction :: A.Value -> T.Parser UnreadReaction
   parseUnreadReaction = A.withObject "UnreadReaction" $ \o -> do
    is_big <- o A..:? "is_big"
    sender_id <- o A..:? "sender_id"
    reaction <- o A..:? "reaction"
    return $ UnreadReaction { is_big = is_big, sender_id = sender_id, reaction = reaction }
 parseJSON _ = mempty
