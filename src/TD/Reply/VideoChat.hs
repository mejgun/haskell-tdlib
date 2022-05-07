{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.VideoChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.MessageSender as MessageSender
import qualified Utils as U

data VideoChat = -- | Describes a video chat
  VideoChat
  { -- | Default group call participant identifier to join the video chat; may be null
    default_participant_id :: Maybe MessageSender.MessageSender,
    -- | True, if the video chat has participants
    has_participants :: Maybe Bool,
    -- | Group call identifier of an active video chat; 0 if none. Full information about the video chat can be received through the method getGroupCall
    group_call_id :: Maybe Int
  }
  deriving (Eq)

instance Show VideoChat where
  show
    VideoChat
      { default_participant_id = default_participant_id,
        has_participants = has_participants,
        group_call_id = group_call_id
      } =
      "VideoChat"
        ++ U.cc
          [ U.p "default_participant_id" default_participant_id,
            U.p "has_participants" has_participants,
            U.p "group_call_id" group_call_id
          ]

instance T.FromJSON VideoChat where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "videoChat" -> parseVideoChat v
      _ -> fail ""
    where
      parseVideoChat :: A.Value -> T.Parser VideoChat
      parseVideoChat = A.withObject "VideoChat" $ \o -> do
        default_participant_id_ <- o A..:? "default_participant_id"
        has_participants_ <- o A..:? "has_participants"
        group_call_id_ <- mconcat [o A..:? "group_call_id", U.rm <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ VideoChat {default_participant_id = default_participant_id_, has_participants = has_participants_, group_call_id = group_call_id_}
  parseJSON _ = fail ""

instance T.ToJSON VideoChat where
  toJSON
    VideoChat
      { default_participant_id = default_participant_id,
        has_participants = has_participants,
        group_call_id = group_call_id
      } =
      A.object
        [ "@type" A..= T.String "videoChat",
          "default_participant_id" A..= default_participant_id,
          "has_participants" A..= has_participants,
          "group_call_id" A..= group_call_id
        ]
