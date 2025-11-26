module TD.Data.StartLiveStoryResult
  (StartLiveStoryResult(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Story as Story
import qualified TD.Data.CanPostStoryResult as CanPostStoryResult

-- | Represents result of starting a live story
data StartLiveStoryResult
  = StartLiveStoryResultOk -- ^ The live story was successfully posted
    { story :: Maybe Story.Story -- ^ The live story
    }
  | StartLiveStoryResultFail -- ^ The live story failed to post with an error to be handled
    { error_type :: Maybe CanPostStoryResult.CanPostStoryResult -- ^ Type of the error; other error types may be returned as regular errors
    }
  deriving (Eq, Show)

instance I.ShortShow StartLiveStoryResult where
  shortShow StartLiveStoryResultOk
    { story = story_
    }
      = "StartLiveStoryResultOk"
        ++ I.cc
        [ "story" `I.p` story_
        ]
  shortShow StartLiveStoryResultFail
    { error_type = error_type_
    }
      = "StartLiveStoryResultFail"
        ++ I.cc
        [ "error_type" `I.p` error_type_
        ]

instance AT.FromJSON StartLiveStoryResult where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "startLiveStoryResultOk"   -> parseStartLiveStoryResultOk v
      "startLiveStoryResultFail" -> parseStartLiveStoryResultFail v
      _                          -> mempty
    
    where
      parseStartLiveStoryResultOk :: A.Value -> AT.Parser StartLiveStoryResult
      parseStartLiveStoryResultOk = A.withObject "StartLiveStoryResultOk" $ \o -> do
        story_ <- o A..:?  "story"
        pure $ StartLiveStoryResultOk
          { story = story_
          }
      parseStartLiveStoryResultFail :: A.Value -> AT.Parser StartLiveStoryResult
      parseStartLiveStoryResultFail = A.withObject "StartLiveStoryResultFail" $ \o -> do
        error_type_ <- o A..:?  "error_type"
        pure $ StartLiveStoryResultFail
          { error_type = error_type_
          }
  parseJSON _ = mempty

