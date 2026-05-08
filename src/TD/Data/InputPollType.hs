module TD.Data.InputPollType
  (InputPollType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText
import {-# SOURCE #-} qualified TD.Data.InputMessageContent as InputMessageContent

-- | Describes the type of poll to send
data InputPollType
  = InputPollTypeRegular -- ^ A regular poll
    { allow_adding_options :: Maybe Bool -- ^ True, if answer options can be added to the poll after creation; not supported in channel chats and for anonymous polls
    }
  | InputPollTypeQuiz -- ^ A poll in quiz mode, which has predefined correct answers
    { correct_option_ids :: Maybe [Int]                                   -- ^ Increasing list of 0-based identifiers of the correct answer options; must be non-empty
    , explanation        :: Maybe FormattedText.FormattedText             -- ^ Text that is shown when the user chooses an incorrect answer or taps on the lamp icon; 0-200 characters with at most 2 line feeds
    , explanation_media  :: Maybe InputMessageContent.InputMessageContent -- ^ Media that is shown when the user chooses an incorrect answer or taps on the lamp icon; pass null if none. Must be one of the following types: inputMessageAnimation, inputMessageAudio, inputMessageDocument, non-live inputMessageLocation, inputMessagePhoto, inputMessageVenue, or inputMessageVideo without caption
    }
  deriving (Eq, Show)

instance I.ShortShow InputPollType where
  shortShow InputPollTypeRegular
    { allow_adding_options = allow_adding_options_
    }
      = "InputPollTypeRegular"
        ++ I.cc
        [ "allow_adding_options" `I.p` allow_adding_options_
        ]
  shortShow InputPollTypeQuiz
    { correct_option_ids = correct_option_ids_
    , explanation        = explanation_
    , explanation_media  = explanation_media_
    }
      = "InputPollTypeQuiz"
        ++ I.cc
        [ "correct_option_ids" `I.p` correct_option_ids_
        , "explanation"        `I.p` explanation_
        , "explanation_media"  `I.p` explanation_media_
        ]

instance AT.FromJSON InputPollType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputPollTypeRegular" -> parseInputPollTypeRegular v
      "inputPollTypeQuiz"    -> parseInputPollTypeQuiz v
      _                      -> mempty
    
    where
      parseInputPollTypeRegular :: A.Value -> AT.Parser InputPollType
      parseInputPollTypeRegular = A.withObject "InputPollTypeRegular" $ \o -> do
        allow_adding_options_ <- o A..:?  "allow_adding_options"
        pure $ InputPollTypeRegular
          { allow_adding_options = allow_adding_options_
          }
      parseInputPollTypeQuiz :: A.Value -> AT.Parser InputPollType
      parseInputPollTypeQuiz = A.withObject "InputPollTypeQuiz" $ \o -> do
        correct_option_ids_ <- o A..:?  "correct_option_ids"
        explanation_        <- o A..:?  "explanation"
        explanation_media_  <- o A..:?  "explanation_media"
        pure $ InputPollTypeQuiz
          { correct_option_ids = correct_option_ids_
          , explanation        = explanation_
          , explanation_media  = explanation_media_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputPollType where
  toJSON InputPollTypeRegular
    { allow_adding_options = allow_adding_options_
    }
      = A.object
        [ "@type"                A..= AT.String "inputPollTypeRegular"
        , "allow_adding_options" A..= allow_adding_options_
        ]
  toJSON InputPollTypeQuiz
    { correct_option_ids = correct_option_ids_
    , explanation        = explanation_
    , explanation_media  = explanation_media_
    }
      = A.object
        [ "@type"              A..= AT.String "inputPollTypeQuiz"
        , "correct_option_ids" A..= correct_option_ids_
        , "explanation"        A..= explanation_
        , "explanation_media"  A..= explanation_media_
        ]

