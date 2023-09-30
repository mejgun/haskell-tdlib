{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.CanSendStoryResult where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Represents result of checking whether the current user can send a story in the specific chat
data CanSendStoryResult
  = -- | A story can be sent
    CanSendStoryResultOk
  | -- | The user must subscribe to Telegram Premium to be able to post stories
    CanSendStoryResultPremiumNeeded
  | -- | The channel chat must be boosted first by Telegram Premium subscribers to post more stories. Call getChatBoostStatus to get current boost status of the chat
    CanSendStoryResultBoostNeeded
  | -- | The limit for the number of active stories exceeded. The user can buy Telegram Premium, delete an active story, or wait for the oldest story to expire
    CanSendStoryResultActiveStoryLimitExceeded
  | -- | The weekly limit for the number of posted stories exceeded. The user needs to buy Telegram Premium or wait specified time @retry_after Time left before the user can send the next story
    CanSendStoryResultWeeklyLimitExceeded
      { -- |
        retry_after :: Maybe Int
      }
  | -- | The monthly limit for the number of posted stories exceeded. The user needs to buy Telegram Premium or wait specified time @retry_after Time left before the user can send the next story
    CanSendStoryResultMonthlyLimitExceeded
      { -- |
        retry_after :: Maybe Int
      }
  deriving (Eq)

instance Show CanSendStoryResult where
  show CanSendStoryResultOk =
    "CanSendStoryResultOk"
      ++ U.cc
        []
  show CanSendStoryResultPremiumNeeded =
    "CanSendStoryResultPremiumNeeded"
      ++ U.cc
        []
  show CanSendStoryResultBoostNeeded =
    "CanSendStoryResultBoostNeeded"
      ++ U.cc
        []
  show CanSendStoryResultActiveStoryLimitExceeded =
    "CanSendStoryResultActiveStoryLimitExceeded"
      ++ U.cc
        []
  show
    CanSendStoryResultWeeklyLimitExceeded
      { retry_after = retry_after_
      } =
      "CanSendStoryResultWeeklyLimitExceeded"
        ++ U.cc
          [ U.p "retry_after" retry_after_
          ]
  show
    CanSendStoryResultMonthlyLimitExceeded
      { retry_after = retry_after_
      } =
      "CanSendStoryResultMonthlyLimitExceeded"
        ++ U.cc
          [ U.p "retry_after" retry_after_
          ]

instance T.FromJSON CanSendStoryResult where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "canSendStoryResultOk" -> parseCanSendStoryResultOk v
      "canSendStoryResultPremiumNeeded" -> parseCanSendStoryResultPremiumNeeded v
      "canSendStoryResultBoostNeeded" -> parseCanSendStoryResultBoostNeeded v
      "canSendStoryResultActiveStoryLimitExceeded" -> parseCanSendStoryResultActiveStoryLimitExceeded v
      "canSendStoryResultWeeklyLimitExceeded" -> parseCanSendStoryResultWeeklyLimitExceeded v
      "canSendStoryResultMonthlyLimitExceeded" -> parseCanSendStoryResultMonthlyLimitExceeded v
      _ -> mempty
    where
      parseCanSendStoryResultOk :: A.Value -> T.Parser CanSendStoryResult
      parseCanSendStoryResultOk = A.withObject "CanSendStoryResultOk" $ \_ -> return CanSendStoryResultOk

      parseCanSendStoryResultPremiumNeeded :: A.Value -> T.Parser CanSendStoryResult
      parseCanSendStoryResultPremiumNeeded = A.withObject "CanSendStoryResultPremiumNeeded" $ \_ -> return CanSendStoryResultPremiumNeeded

      parseCanSendStoryResultBoostNeeded :: A.Value -> T.Parser CanSendStoryResult
      parseCanSendStoryResultBoostNeeded = A.withObject "CanSendStoryResultBoostNeeded" $ \_ -> return CanSendStoryResultBoostNeeded

      parseCanSendStoryResultActiveStoryLimitExceeded :: A.Value -> T.Parser CanSendStoryResult
      parseCanSendStoryResultActiveStoryLimitExceeded = A.withObject "CanSendStoryResultActiveStoryLimitExceeded" $ \_ -> return CanSendStoryResultActiveStoryLimitExceeded

      parseCanSendStoryResultWeeklyLimitExceeded :: A.Value -> T.Parser CanSendStoryResult
      parseCanSendStoryResultWeeklyLimitExceeded = A.withObject "CanSendStoryResultWeeklyLimitExceeded" $ \o -> do
        retry_after_ <- o A..:? "retry_after"
        return $ CanSendStoryResultWeeklyLimitExceeded {retry_after = retry_after_}

      parseCanSendStoryResultMonthlyLimitExceeded :: A.Value -> T.Parser CanSendStoryResult
      parseCanSendStoryResultMonthlyLimitExceeded = A.withObject "CanSendStoryResultMonthlyLimitExceeded" $ \o -> do
        retry_after_ <- o A..:? "retry_after"
        return $ CanSendStoryResultMonthlyLimitExceeded {retry_after = retry_after_}
  parseJSON _ = mempty

instance T.ToJSON CanSendStoryResult where
  toJSON CanSendStoryResultOk =
    A.object
      [ "@type" A..= T.String "canSendStoryResultOk"
      ]
  toJSON CanSendStoryResultPremiumNeeded =
    A.object
      [ "@type" A..= T.String "canSendStoryResultPremiumNeeded"
      ]
  toJSON CanSendStoryResultBoostNeeded =
    A.object
      [ "@type" A..= T.String "canSendStoryResultBoostNeeded"
      ]
  toJSON CanSendStoryResultActiveStoryLimitExceeded =
    A.object
      [ "@type" A..= T.String "canSendStoryResultActiveStoryLimitExceeded"
      ]
  toJSON
    CanSendStoryResultWeeklyLimitExceeded
      { retry_after = retry_after_
      } =
      A.object
        [ "@type" A..= T.String "canSendStoryResultWeeklyLimitExceeded",
          "retry_after" A..= retry_after_
        ]
  toJSON
    CanSendStoryResultMonthlyLimitExceeded
      { retry_after = retry_after_
      } =
      A.object
        [ "@type" A..= T.String "canSendStoryResultMonthlyLimitExceeded",
          "retry_after" A..= retry_after_
        ]
