{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.ChatStatisticsMessageInteractionInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

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
      { forward_count = forward_count,
        view_count = view_count,
        message_id = message_id
      } =
      "ChatStatisticsMessageInteractionInfo"
        ++ U.cc
          [ U.p "forward_count" forward_count,
            U.p "view_count" view_count,
            U.p "message_id" message_id
          ]

instance T.FromJSON ChatStatisticsMessageInteractionInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatStatisticsMessageInteractionInfo" -> parseChatStatisticsMessageInteractionInfo v
      _ -> fail ""
    where
      parseChatStatisticsMessageInteractionInfo :: A.Value -> T.Parser ChatStatisticsMessageInteractionInfo
      parseChatStatisticsMessageInteractionInfo = A.withObject "ChatStatisticsMessageInteractionInfo" $ \o -> do
        forward_count_ <- mconcat [o A..:? "forward_count", U.rm <$> (o A..: "forward_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        view_count_ <- mconcat [o A..:? "view_count", U.rm <$> (o A..: "view_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        message_id_ <- mconcat [o A..:? "message_id", U.rm <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ChatStatisticsMessageInteractionInfo {forward_count = forward_count_, view_count = view_count_, message_id = message_id_}
  parseJSON _ = fail ""

instance T.ToJSON ChatStatisticsMessageInteractionInfo where
  toJSON
    ChatStatisticsMessageInteractionInfo
      { forward_count = forward_count,
        view_count = view_count,
        message_id = message_id
      } =
      A.object
        [ "@type" A..= T.String "chatStatisticsMessageInteractionInfo",
          "forward_count" A..= forward_count,
          "view_count" A..= view_count,
          "message_id" A..= message_id
        ]
