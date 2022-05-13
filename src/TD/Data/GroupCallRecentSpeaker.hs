{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.GroupCallRecentSpeaker where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.MessageSender as MessageSender
import qualified Utils as U

data GroupCallRecentSpeaker = -- | Describes a recently speaking participant in a group call @participant_id Group call participant identifier @is_speaking True, is the user has spoken recently
  GroupCallRecentSpeaker
  { -- |
    is_speaking :: Maybe Bool,
    -- |
    participant_id :: Maybe MessageSender.MessageSender
  }
  deriving (Eq)

instance Show GroupCallRecentSpeaker where
  show
    GroupCallRecentSpeaker
      { is_speaking = is_speaking_,
        participant_id = participant_id_
      } =
      "GroupCallRecentSpeaker"
        ++ U.cc
          [ U.p "is_speaking" is_speaking_,
            U.p "participant_id" participant_id_
          ]

instance T.FromJSON GroupCallRecentSpeaker where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "groupCallRecentSpeaker" -> parseGroupCallRecentSpeaker v
      _ -> mempty
    where
      parseGroupCallRecentSpeaker :: A.Value -> T.Parser GroupCallRecentSpeaker
      parseGroupCallRecentSpeaker = A.withObject "GroupCallRecentSpeaker" $ \o -> do
        is_speaking_ <- o A..:? "is_speaking"
        participant_id_ <- o A..:? "participant_id"
        return $ GroupCallRecentSpeaker {is_speaking = is_speaking_, participant_id = participant_id_}
  parseJSON _ = mempty

instance T.ToJSON GroupCallRecentSpeaker where
  toJSON
    GroupCallRecentSpeaker
      { is_speaking = is_speaking_,
        participant_id = participant_id_
      } =
      A.object
        [ "@type" A..= T.String "groupCallRecentSpeaker",
          "is_speaking" A..= is_speaking_,
          "participant_id" A..= participant_id_
        ]
