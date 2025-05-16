module TD.Data.CanPostStoryResult
  (CanPostStoryResult(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Represents result of checking whether the current user can post a story on behalf of the specific chat
data CanPostStoryResult
  = CanPostStoryResultOk -- ^ A story can be sent
    { story_count :: Maybe Int -- ^ Number of stories that can be posted by the user
    }
  | CanPostStoryResultPremiumNeeded -- ^ The user must subscribe to Telegram Premium to be able to post stories
  | CanPostStoryResultBoostNeeded -- ^ The chat must be boosted first by Telegram Premium subscribers to post more stories. Call getChatBoostStatus to get current boost status of the chat
  | CanPostStoryResultActiveStoryLimitExceeded -- ^ The limit for the number of active stories exceeded. The user can buy Telegram Premium, delete an active story, or wait for the oldest story to expire
  | CanPostStoryResultWeeklyLimitExceeded -- ^ The weekly limit for the number of posted stories exceeded. The user needs to buy Telegram Premium or wait specified time
    { retry_after :: Maybe Int -- ^ Time left before the user can post the next story
    }
  | CanPostStoryResultMonthlyLimitExceeded -- ^ The monthly limit for the number of posted stories exceeded. The user needs to buy Telegram Premium or wait specified time
    { retry_after :: Maybe Int -- ^ Time left before the user can post the next story
    }
  deriving (Eq, Show)

instance I.ShortShow CanPostStoryResult where
  shortShow CanPostStoryResultOk
    { story_count = story_count_
    }
      = "CanPostStoryResultOk"
        ++ I.cc
        [ "story_count" `I.p` story_count_
        ]
  shortShow CanPostStoryResultPremiumNeeded
      = "CanPostStoryResultPremiumNeeded"
  shortShow CanPostStoryResultBoostNeeded
      = "CanPostStoryResultBoostNeeded"
  shortShow CanPostStoryResultActiveStoryLimitExceeded
      = "CanPostStoryResultActiveStoryLimitExceeded"
  shortShow CanPostStoryResultWeeklyLimitExceeded
    { retry_after = retry_after_
    }
      = "CanPostStoryResultWeeklyLimitExceeded"
        ++ I.cc
        [ "retry_after" `I.p` retry_after_
        ]
  shortShow CanPostStoryResultMonthlyLimitExceeded
    { retry_after = retry_after_
    }
      = "CanPostStoryResultMonthlyLimitExceeded"
        ++ I.cc
        [ "retry_after" `I.p` retry_after_
        ]

instance AT.FromJSON CanPostStoryResult where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "canPostStoryResultOk"                       -> parseCanPostStoryResultOk v
      "canPostStoryResultPremiumNeeded"            -> pure CanPostStoryResultPremiumNeeded
      "canPostStoryResultBoostNeeded"              -> pure CanPostStoryResultBoostNeeded
      "canPostStoryResultActiveStoryLimitExceeded" -> pure CanPostStoryResultActiveStoryLimitExceeded
      "canPostStoryResultWeeklyLimitExceeded"      -> parseCanPostStoryResultWeeklyLimitExceeded v
      "canPostStoryResultMonthlyLimitExceeded"     -> parseCanPostStoryResultMonthlyLimitExceeded v
      _                                            -> mempty
    
    where
      parseCanPostStoryResultOk :: A.Value -> AT.Parser CanPostStoryResult
      parseCanPostStoryResultOk = A.withObject "CanPostStoryResultOk" $ \o -> do
        story_count_ <- o A..:?  "story_count"
        pure $ CanPostStoryResultOk
          { story_count = story_count_
          }
      parseCanPostStoryResultWeeklyLimitExceeded :: A.Value -> AT.Parser CanPostStoryResult
      parseCanPostStoryResultWeeklyLimitExceeded = A.withObject "CanPostStoryResultWeeklyLimitExceeded" $ \o -> do
        retry_after_ <- o A..:?  "retry_after"
        pure $ CanPostStoryResultWeeklyLimitExceeded
          { retry_after = retry_after_
          }
      parseCanPostStoryResultMonthlyLimitExceeded :: A.Value -> AT.Parser CanPostStoryResult
      parseCanPostStoryResultMonthlyLimitExceeded = A.withObject "CanPostStoryResultMonthlyLimitExceeded" $ \o -> do
        retry_after_ <- o A..:?  "retry_after"
        pure $ CanPostStoryResultMonthlyLimitExceeded
          { retry_after = retry_after_
          }
  parseJSON _ = mempty

