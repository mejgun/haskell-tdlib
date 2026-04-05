module TD.Data.PollType
  (PollType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText
import {-# SOURCE #-} qualified TD.Data.MessageContent as MessageContent

-- | Describes the type of poll
data PollType
  = PollTypeRegular -- ^ A regular poll
  | PollTypeQuiz -- ^ A poll in quiz mode, which has predefined correct answers
    { correct_option_ids :: Maybe [Int]                         -- ^ Increasing list of 0-based identifiers of the correct answer options; empty for a yet unanswered poll
    , explanation        :: Maybe FormattedText.FormattedText   -- ^ Text that is shown when the user chooses an incorrect answer or taps on the lamp icon; empty for a yet unanswered poll
    , explanation_media  :: Maybe MessageContent.MessageContent -- ^ Media that is shown when the user chooses an incorrect answer or taps on the lamp icon; may be null if none or the poll is unanswered yet. Currently, can be only of the types messageAnimation, messageAudio, messageDocument, messageLocation, messagePhoto, messageVenue, or messageVideo without caption
    }
  deriving (Eq, Show)

instance I.ShortShow PollType where
  shortShow PollTypeRegular
      = "PollTypeRegular"
  shortShow PollTypeQuiz
    { correct_option_ids = correct_option_ids_
    , explanation        = explanation_
    , explanation_media  = explanation_media_
    }
      = "PollTypeQuiz"
        ++ I.cc
        [ "correct_option_ids" `I.p` correct_option_ids_
        , "explanation"        `I.p` explanation_
        , "explanation_media"  `I.p` explanation_media_
        ]

instance AT.FromJSON PollType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "pollTypeRegular" -> pure PollTypeRegular
      "pollTypeQuiz"    -> parsePollTypeQuiz v
      _                 -> mempty
    
    where
      parsePollTypeQuiz :: A.Value -> AT.Parser PollType
      parsePollTypeQuiz = A.withObject "PollTypeQuiz" $ \o -> do
        correct_option_ids_ <- o A..:?  "correct_option_ids"
        explanation_        <- o A..:?  "explanation"
        explanation_media_  <- o A..:?  "explanation_media"
        pure $ PollTypeQuiz
          { correct_option_ids = correct_option_ids_
          , explanation        = explanation_
          , explanation_media  = explanation_media_
          }
  parseJSON _ = mempty

