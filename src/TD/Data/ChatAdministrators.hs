{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatAdministrators where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatAdministrator as ChatAdministrator
import qualified Utils as U

-- |
data ChatAdministrators = -- | Represents a list of chat administrators @administrators A list of chat administrators
  ChatAdministrators
  { -- |
    administrators :: Maybe [ChatAdministrator.ChatAdministrator]
  }
  deriving (Eq)

instance Show ChatAdministrators where
  show
    ChatAdministrators
      { administrators = administrators_
      } =
      "ChatAdministrators"
        ++ U.cc
          [ U.p "administrators" administrators_
          ]

instance T.FromJSON ChatAdministrators where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatAdministrators" -> parseChatAdministrators v
      _ -> mempty
    where
      parseChatAdministrators :: A.Value -> T.Parser ChatAdministrators
      parseChatAdministrators = A.withObject "ChatAdministrators" $ \o -> do
        administrators_ <- o A..:? "administrators"
        return $ ChatAdministrators {administrators = administrators_}
  parseJSON _ = mempty

instance T.ToJSON ChatAdministrators where
  toJSON
    ChatAdministrators
      { administrators = administrators_
      } =
      A.object
        [ "@type" A..= T.String "chatAdministrators",
          "administrators" A..= administrators_
        ]
