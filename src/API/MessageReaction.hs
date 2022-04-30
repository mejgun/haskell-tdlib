-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessageReaction where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.MessageSender as MessageSender

-- |
-- 
-- Contains information about a reaction to a message
-- 
-- __reaction__ Text representation of the reaction
-- 
-- __total_count__ Number of times the reaction was added
-- 
-- __is_chosen__ True, if the reaction is chosen by the current user
-- 
-- __recent_sender_ids__ Identifiers of at most 3 recent message senders, added the reaction; available in private, basic group and supergroup chats
data MessageReaction = 

 MessageReaction { recent_sender_ids :: Maybe [MessageSender.MessageSender], is_chosen :: Maybe Bool, total_count :: Maybe Int, reaction :: Maybe String }  deriving (Eq)

instance Show MessageReaction where
 show MessageReaction { recent_sender_ids=recent_sender_ids, is_chosen=is_chosen, total_count=total_count, reaction=reaction } =
  "MessageReaction" ++ U.cc [U.p "recent_sender_ids" recent_sender_ids, U.p "is_chosen" is_chosen, U.p "total_count" total_count, U.p "reaction" reaction ]

instance T.ToJSON MessageReaction where
 toJSON MessageReaction { recent_sender_ids = recent_sender_ids, is_chosen = is_chosen, total_count = total_count, reaction = reaction } =
  A.object [ "@type" A..= T.String "messageReaction", "recent_sender_ids" A..= recent_sender_ids, "is_chosen" A..= is_chosen, "total_count" A..= total_count, "reaction" A..= reaction ]

instance T.FromJSON MessageReaction where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "messageReaction" -> parseMessageReaction v
   _ -> mempty
  where
   parseMessageReaction :: A.Value -> T.Parser MessageReaction
   parseMessageReaction = A.withObject "MessageReaction" $ \o -> do
    recent_sender_ids <- o A..:? "recent_sender_ids"
    is_chosen <- o A..:? "is_chosen"
    total_count <- mconcat [ o A..:? "total_count", readMaybe <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    reaction <- o A..:? "reaction"
    return $ MessageReaction { recent_sender_ids = recent_sender_ids, is_chosen = is_chosen, total_count = total_count, reaction = reaction }
 parseJSON _ = mempty
