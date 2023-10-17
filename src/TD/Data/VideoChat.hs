module TD.Data.VideoChat
  (VideoChat(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

data VideoChat
  = VideoChat -- ^ Describes a video chat
    { group_call_id          :: Maybe Int                         -- ^ Group call identifier of an active video chat; 0 if none. Full information about the video chat can be received through the method getGroupCall
    , has_participants       :: Maybe Bool                        -- ^ True, if the video chat has participants
    , default_participant_id :: Maybe MessageSender.MessageSender -- ^ Default group call participant identifier to join the video chat; may be null
    }
  deriving (Eq, Show)

instance I.ShortShow VideoChat where
  shortShow VideoChat
    { group_call_id          = group_call_id_
    , has_participants       = has_participants_
    , default_participant_id = default_participant_id_
    }
      = "VideoChat"
        ++ I.cc
        [ "group_call_id"          `I.p` group_call_id_
        , "has_participants"       `I.p` has_participants_
        , "default_participant_id" `I.p` default_participant_id_
        ]

instance AT.FromJSON VideoChat where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "videoChat" -> parseVideoChat v
      _           -> mempty
    
    where
      parseVideoChat :: A.Value -> AT.Parser VideoChat
      parseVideoChat = A.withObject "VideoChat" $ \o -> do
        group_call_id_          <- o A..:?  "group_call_id"
        has_participants_       <- o A..:?  "has_participants"
        default_participant_id_ <- o A..:?  "default_participant_id"
        pure $ VideoChat
          { group_call_id          = group_call_id_
          , has_participants       = has_participants_
          , default_participant_id = default_participant_id_
          }
  parseJSON _ = mempty

