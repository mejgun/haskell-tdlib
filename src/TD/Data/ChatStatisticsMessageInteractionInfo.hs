{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatStatisticsMessageInteractionInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data ChatStatisticsMessageInteractionInfo = -- | Contains statistics about interactions with a message
  ChatStatisticsMessageInteractionInfo
  { -- | Number of times the message was forwarded
    forward_count :: Maybe Int,
    -- | Number of times the message was viewed
    view_count :: Maybe Int,
    -- | Message identifier
    message_id :: Maybe Int
  }
  deriving (Eq)

instance Show ChatStatisticsMessageInteractionInfo where
  show
    ChatStatisticsMessageInteractionInfo
      { forward_count = forward_count_,
        view_count = view_count_,
        message_id = message_id_
      } =
      "ChatStatisticsMessageInteractionInfo"
        ++ U.cc
          [ U.p "forward_count" forward_count_,
            U.p "view_count" view_count_,
            U.p "message_id" message_id_
          ]

instance T.FromJSON ChatStatisticsMessageInteractionInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatStatisticsMessageInteractionInfo" -> parseChatStatisticsMessageInteractionInfo v
      _ -> mempty
    where
      parseChatStatisticsMessageInteractionInfo :: A.Value -> T.Parser ChatStatisticsMessageInteractionInfo
      parseChatStatisticsMessageInteractionInfo = A.withObject "ChatStatisticsMessageInteractionInfo" $ \o -> do
        forward_count_ <- o A..:? "forward_count"
        view_count_ <- o A..:? "view_count"
        message_id_ <- o A..:? "message_id"
        return $ ChatStatisticsMessageInteractionInfo {forward_count = forward_count_, view_count = view_count_, message_id = message_id_}
  parseJSON _ = mempty

instance T.ToJSON ChatStatisticsMessageInteractionInfo where
  toJSON
    ChatStatisticsMessageInteractionInfo
      { forward_count = forward_count_,
        view_count = view_count_,
        message_id = message_id_
      } =
      A.object
        [ "@type" A..= T.String "chatStatisticsMessageInteractionInfo",
          "forward_count" A..= forward_count_,
          "view_count" A..= view_count_,
          "message_id" A..= message_id_
        ]
