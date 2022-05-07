{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.ChatAdministrators where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.ChatAdministrator as ChatAdministrator
import qualified Utils as U

data ChatAdministrators = -- | Represents a list of chat administrators @administrators A list of chat administrators
  ChatAdministrators
  { -- |
    administrators :: Maybe [ChatAdministrator.ChatAdministrator]
  }
  deriving (Eq)

instance Show ChatAdministrators where
  show
    ChatAdministrators
      { administrators = administrators
      } =
      "ChatAdministrators"
        ++ U.cc
          [ U.p "administrators" administrators
          ]

instance T.FromJSON ChatAdministrators where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatAdministrators" -> parseChatAdministrators v
      _ -> fail ""
    where
      parseChatAdministrators :: A.Value -> T.Parser ChatAdministrators
      parseChatAdministrators = A.withObject "ChatAdministrators" $ \o -> do
        administrators_ <- o A..:? "administrators"
        return $ ChatAdministrators {administrators = administrators_}
  parseJSON _ = fail ""

instance T.ToJSON ChatAdministrators where
  toJSON
    ChatAdministrators
      { administrators = administrators
      } =
      A.object
        [ "@type" A..= T.String "chatAdministrators",
          "administrators" A..= administrators
        ]
