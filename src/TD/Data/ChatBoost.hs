{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatBoost where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data ChatBoost = -- | Describes a boost of a chat @user_id Identifier of a user that boosted the chat @expiration_date Point in time (Unix timestamp) when the boost will automatically expire if the user will not prolongate their Telegram Premium subscription
  ChatBoost
  { -- |
    expiration_date :: Maybe Int,
    -- |
    user_id :: Maybe Int
  }
  deriving (Eq)

instance Show ChatBoost where
  show
    ChatBoost
      { expiration_date = expiration_date_,
        user_id = user_id_
      } =
      "ChatBoost"
        ++ U.cc
          [ U.p "expiration_date" expiration_date_,
            U.p "user_id" user_id_
          ]

instance T.FromJSON ChatBoost where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatBoost" -> parseChatBoost v
      _ -> mempty
    where
      parseChatBoost :: A.Value -> T.Parser ChatBoost
      parseChatBoost = A.withObject "ChatBoost" $ \o -> do
        expiration_date_ <- o A..:? "expiration_date"
        user_id_ <- o A..:? "user_id"
        return $ ChatBoost {expiration_date = expiration_date_, user_id = user_id_}
  parseJSON _ = mempty

instance T.ToJSON ChatBoost where
  toJSON
    ChatBoost
      { expiration_date = expiration_date_,
        user_id = user_id_
      } =
      A.object
        [ "@type" A..= T.String "chatBoost",
          "expiration_date" A..= expiration_date_,
          "user_id" A..= user_id_
        ]
