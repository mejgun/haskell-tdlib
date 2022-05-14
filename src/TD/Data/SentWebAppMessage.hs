{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.SentWebAppMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data SentWebAppMessage = -- | Information about the message sent by answerWebAppQuery @inline_message_id Identifier of the sent inline message, if known
  SentWebAppMessage
  { -- |
    inline_message_id :: Maybe String
  }
  deriving (Eq)

instance Show SentWebAppMessage where
  show
    SentWebAppMessage
      { inline_message_id = inline_message_id_
      } =
      "SentWebAppMessage"
        ++ U.cc
          [ U.p "inline_message_id" inline_message_id_
          ]

instance T.FromJSON SentWebAppMessage where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "sentWebAppMessage" -> parseSentWebAppMessage v
      _ -> mempty
    where
      parseSentWebAppMessage :: A.Value -> T.Parser SentWebAppMessage
      parseSentWebAppMessage = A.withObject "SentWebAppMessage" $ \o -> do
        inline_message_id_ <- o A..:? "inline_message_id"
        return $ SentWebAppMessage {inline_message_id = inline_message_id_}
  parseJSON _ = mempty

instance T.ToJSON SentWebAppMessage where
  toJSON
    SentWebAppMessage
      { inline_message_id = inline_message_id_
      } =
      A.object
        [ "@type" A..= T.String "sentWebAppMessage",
          "inline_message_id" A..= inline_message_id_
        ]
