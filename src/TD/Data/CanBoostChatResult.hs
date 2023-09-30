{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.CanBoostChatResult where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Represents result of checking whether the current user can boost the specific chat
data CanBoostChatResult
  = -- | The chat can be boosted @currently_boosted_chat_id Identifier of the currently boosted chat from which boost will be removed; 0 if none
    CanBoostChatResultOk
      { -- |
        currently_boosted_chat_id :: Maybe Int
      }
  | -- | The chat can't be boosted
    CanBoostChatResultInvalidChat
  | -- | The chat is already boosted by the user
    CanBoostChatResultAlreadyBoosted
  | -- | The user must subscribe to Telegram Premium to be able to boost chats
    CanBoostChatResultPremiumNeeded
  | -- | The user must have Telegram Premium subscription instead of a gifted Telegram Premium
    CanBoostChatResultPremiumSubscriptionNeeded
  | -- | The user must wait the specified time before the boost can be moved to another chat @retry_after Time left before the user can boost another chat
    CanBoostChatResultWaitNeeded
      { -- |
        retry_after :: Maybe Int
      }
  deriving (Eq)

instance Show CanBoostChatResult where
  show
    CanBoostChatResultOk
      { currently_boosted_chat_id = currently_boosted_chat_id_
      } =
      "CanBoostChatResultOk"
        ++ U.cc
          [ U.p "currently_boosted_chat_id" currently_boosted_chat_id_
          ]
  show CanBoostChatResultInvalidChat =
    "CanBoostChatResultInvalidChat"
      ++ U.cc
        []
  show CanBoostChatResultAlreadyBoosted =
    "CanBoostChatResultAlreadyBoosted"
      ++ U.cc
        []
  show CanBoostChatResultPremiumNeeded =
    "CanBoostChatResultPremiumNeeded"
      ++ U.cc
        []
  show CanBoostChatResultPremiumSubscriptionNeeded =
    "CanBoostChatResultPremiumSubscriptionNeeded"
      ++ U.cc
        []
  show
    CanBoostChatResultWaitNeeded
      { retry_after = retry_after_
      } =
      "CanBoostChatResultWaitNeeded"
        ++ U.cc
          [ U.p "retry_after" retry_after_
          ]

instance T.FromJSON CanBoostChatResult where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "canBoostChatResultOk" -> parseCanBoostChatResultOk v
      "canBoostChatResultInvalidChat" -> parseCanBoostChatResultInvalidChat v
      "canBoostChatResultAlreadyBoosted" -> parseCanBoostChatResultAlreadyBoosted v
      "canBoostChatResultPremiumNeeded" -> parseCanBoostChatResultPremiumNeeded v
      "canBoostChatResultPremiumSubscriptionNeeded" -> parseCanBoostChatResultPremiumSubscriptionNeeded v
      "canBoostChatResultWaitNeeded" -> parseCanBoostChatResultWaitNeeded v
      _ -> mempty
    where
      parseCanBoostChatResultOk :: A.Value -> T.Parser CanBoostChatResult
      parseCanBoostChatResultOk = A.withObject "CanBoostChatResultOk" $ \o -> do
        currently_boosted_chat_id_ <- o A..:? "currently_boosted_chat_id"
        return $ CanBoostChatResultOk {currently_boosted_chat_id = currently_boosted_chat_id_}

      parseCanBoostChatResultInvalidChat :: A.Value -> T.Parser CanBoostChatResult
      parseCanBoostChatResultInvalidChat = A.withObject "CanBoostChatResultInvalidChat" $ \_ -> return CanBoostChatResultInvalidChat

      parseCanBoostChatResultAlreadyBoosted :: A.Value -> T.Parser CanBoostChatResult
      parseCanBoostChatResultAlreadyBoosted = A.withObject "CanBoostChatResultAlreadyBoosted" $ \_ -> return CanBoostChatResultAlreadyBoosted

      parseCanBoostChatResultPremiumNeeded :: A.Value -> T.Parser CanBoostChatResult
      parseCanBoostChatResultPremiumNeeded = A.withObject "CanBoostChatResultPremiumNeeded" $ \_ -> return CanBoostChatResultPremiumNeeded

      parseCanBoostChatResultPremiumSubscriptionNeeded :: A.Value -> T.Parser CanBoostChatResult
      parseCanBoostChatResultPremiumSubscriptionNeeded = A.withObject "CanBoostChatResultPremiumSubscriptionNeeded" $ \_ -> return CanBoostChatResultPremiumSubscriptionNeeded

      parseCanBoostChatResultWaitNeeded :: A.Value -> T.Parser CanBoostChatResult
      parseCanBoostChatResultWaitNeeded = A.withObject "CanBoostChatResultWaitNeeded" $ \o -> do
        retry_after_ <- o A..:? "retry_after"
        return $ CanBoostChatResultWaitNeeded {retry_after = retry_after_}
  parseJSON _ = mempty

instance T.ToJSON CanBoostChatResult where
  toJSON
    CanBoostChatResultOk
      { currently_boosted_chat_id = currently_boosted_chat_id_
      } =
      A.object
        [ "@type" A..= T.String "canBoostChatResultOk",
          "currently_boosted_chat_id" A..= currently_boosted_chat_id_
        ]
  toJSON CanBoostChatResultInvalidChat =
    A.object
      [ "@type" A..= T.String "canBoostChatResultInvalidChat"
      ]
  toJSON CanBoostChatResultAlreadyBoosted =
    A.object
      [ "@type" A..= T.String "canBoostChatResultAlreadyBoosted"
      ]
  toJSON CanBoostChatResultPremiumNeeded =
    A.object
      [ "@type" A..= T.String "canBoostChatResultPremiumNeeded"
      ]
  toJSON CanBoostChatResultPremiumSubscriptionNeeded =
    A.object
      [ "@type" A..= T.String "canBoostChatResultPremiumSubscriptionNeeded"
      ]
  toJSON
    CanBoostChatResultWaitNeeded
      { retry_after = retry_after_
      } =
      A.object
        [ "@type" A..= T.String "canBoostChatResultWaitNeeded",
          "retry_after" A..= retry_after_
        ]
