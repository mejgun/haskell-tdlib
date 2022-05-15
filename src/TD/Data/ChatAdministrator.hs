{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatAdministrator where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data ChatAdministrator = -- | Contains information about a chat administrator @user_id User identifier of the administrator @custom_title Custom title of the administrator @is_owner True, if the user is the owner of the chat
  ChatAdministrator
  { -- |
    is_owner :: Maybe Bool,
    -- |
    custom_title :: Maybe String,
    -- |
    user_id :: Maybe Int
  }
  deriving (Eq)

instance Show ChatAdministrator where
  show
    ChatAdministrator
      { is_owner = is_owner_,
        custom_title = custom_title_,
        user_id = user_id_
      } =
      "ChatAdministrator"
        ++ U.cc
          [ U.p "is_owner" is_owner_,
            U.p "custom_title" custom_title_,
            U.p "user_id" user_id_
          ]

instance T.FromJSON ChatAdministrator where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatAdministrator" -> parseChatAdministrator v
      _ -> mempty
    where
      parseChatAdministrator :: A.Value -> T.Parser ChatAdministrator
      parseChatAdministrator = A.withObject "ChatAdministrator" $ \o -> do
        is_owner_ <- o A..:? "is_owner"
        custom_title_ <- o A..:? "custom_title"
        user_id_ <- o A..:? "user_id"
        return $ ChatAdministrator {is_owner = is_owner_, custom_title = custom_title_, user_id = user_id_}
  parseJSON _ = mempty

instance T.ToJSON ChatAdministrator where
  toJSON
    ChatAdministrator
      { is_owner = is_owner_,
        custom_title = custom_title_,
        user_id = user_id_
      } =
      A.object
        [ "@type" A..= T.String "chatAdministrator",
          "is_owner" A..= is_owner_,
          "custom_title" A..= custom_title_,
          "user_id" A..= user_id_
        ]
