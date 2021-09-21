-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.GroupCallRecentSpeaker where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.MessageSender as MessageSender

-- |
-- 
-- Describes a recently speaking participant in a group call 
-- 
-- __participant_id__ Group call participant identifier
-- 
-- __is_speaking__ True, is the user has spoken recently
data GroupCallRecentSpeaker = 

 GroupCallRecentSpeaker { is_speaking :: Maybe Bool, participant_id :: Maybe MessageSender.MessageSender }  deriving (Show, Eq)

instance T.ToJSON GroupCallRecentSpeaker where
 toJSON (GroupCallRecentSpeaker { is_speaking = is_speaking, participant_id = participant_id }) =
  A.object [ "@type" A..= T.String "groupCallRecentSpeaker", "is_speaking" A..= is_speaking, "participant_id" A..= participant_id ]

instance T.FromJSON GroupCallRecentSpeaker where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "groupCallRecentSpeaker" -> parseGroupCallRecentSpeaker v
   _ -> mempty
  where
   parseGroupCallRecentSpeaker :: A.Value -> T.Parser GroupCallRecentSpeaker
   parseGroupCallRecentSpeaker = A.withObject "GroupCallRecentSpeaker" $ \o -> do
    is_speaking <- o A..:? "is_speaking"
    participant_id <- o A..:? "participant_id"
    return $ GroupCallRecentSpeaker { is_speaking = is_speaking, participant_id = participant_id }