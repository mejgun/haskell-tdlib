module TD.Data.CanSendStoryResult
  (CanSendStoryResult(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Represents result of checking whether the current user can send a story in the specific chat
data CanSendStoryResult
  = CanSendStoryResultOk -- ^ A story can be sent
  | CanSendStoryResultPremiumNeeded -- ^ The user must subscribe to Telegram Premium to be able to post stories
  | CanSendStoryResultBoostNeeded -- ^ The chat must be boosted first by Telegram Premium subscribers to post more stories. Call getChatBoostStatus to get current boost status of the chat
  | CanSendStoryResultActiveStoryLimitExceeded -- ^ The limit for the number of active stories exceeded. The user can buy Telegram Premium, delete an active story, or wait for the oldest story to expire
  | CanSendStoryResultWeeklyLimitExceeded -- ^ The weekly limit for the number of posted stories exceeded. The user needs to buy Telegram Premium or wait specified time
    { retry_after :: Maybe Int -- ^ Time left before the user can send the next story
    }
  | CanSendStoryResultMonthlyLimitExceeded -- ^ The monthly limit for the number of posted stories exceeded. The user needs to buy Telegram Premium or wait specified time
    { retry_after :: Maybe Int -- ^ Time left before the user can send the next story
    }
  deriving (Eq, Show)

instance I.ShortShow CanSendStoryResult where
  shortShow CanSendStoryResultOk
      = "CanSendStoryResultOk"
  shortShow CanSendStoryResultPremiumNeeded
      = "CanSendStoryResultPremiumNeeded"
  shortShow CanSendStoryResultBoostNeeded
      = "CanSendStoryResultBoostNeeded"
  shortShow CanSendStoryResultActiveStoryLimitExceeded
      = "CanSendStoryResultActiveStoryLimitExceeded"
  shortShow CanSendStoryResultWeeklyLimitExceeded
    { retry_after = retry_after_
    }
      = "CanSendStoryResultWeeklyLimitExceeded"
        ++ I.cc
        [ "retry_after" `I.p` retry_after_
        ]
  shortShow CanSendStoryResultMonthlyLimitExceeded
    { retry_after = retry_after_
    }
      = "CanSendStoryResultMonthlyLimitExceeded"
        ++ I.cc
        [ "retry_after" `I.p` retry_after_
        ]

instance AT.FromJSON CanSendStoryResult where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "canSendStoryResultOk"                       -> pure CanSendStoryResultOk
      "canSendStoryResultPremiumNeeded"            -> pure CanSendStoryResultPremiumNeeded
      "canSendStoryResultBoostNeeded"              -> pure CanSendStoryResultBoostNeeded
      "canSendStoryResultActiveStoryLimitExceeded" -> pure CanSendStoryResultActiveStoryLimitExceeded
      "canSendStoryResultWeeklyLimitExceeded"      -> parseCanSendStoryResultWeeklyLimitExceeded v
      "canSendStoryResultMonthlyLimitExceeded"     -> parseCanSendStoryResultMonthlyLimitExceeded v
      _                                            -> mempty
    
    where
      parseCanSendStoryResultWeeklyLimitExceeded :: A.Value -> AT.Parser CanSendStoryResult
      parseCanSendStoryResultWeeklyLimitExceeded = A.withObject "CanSendStoryResultWeeklyLimitExceeded" $ \o -> do
        retry_after_ <- o A..:?  "retry_after"
        pure $ CanSendStoryResultWeeklyLimitExceeded
          { retry_after = retry_after_
          }
      parseCanSendStoryResultMonthlyLimitExceeded :: A.Value -> AT.Parser CanSendStoryResult
      parseCanSendStoryResultMonthlyLimitExceeded = A.withObject "CanSendStoryResultMonthlyLimitExceeded" $ \o -> do
        retry_after_ <- o A..:?  "retry_after"
        pure $ CanSendStoryResultMonthlyLimitExceeded
          { retry_after = retry_after_
          }
  parseJSON _ = mempty

