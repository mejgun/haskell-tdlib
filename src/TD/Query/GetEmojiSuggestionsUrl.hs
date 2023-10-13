module TD.Query.GetEmojiSuggestionsUrl
  (GetEmojiSuggestionsUrl(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data GetEmojiSuggestionsUrl -- ^ Returns an HTTP URL which can be used to automatically log in to the translation platform and suggest new emoji replacements. The URL will be valid for 30 seconds after generation
  = GetEmojiSuggestionsUrl
    { language_code :: Maybe T.Text -- ^ Language code for which the emoji replacements will be suggested
    }
  deriving (Eq)

instance Show GetEmojiSuggestionsUrl where
  show
    GetEmojiSuggestionsUrl
      { language_code = language_code_
      }
        = "GetEmojiSuggestionsUrl"
          ++ I.cc
          [ "language_code" `I.p` language_code_
          ]

instance AT.ToJSON GetEmojiSuggestionsUrl where
  toJSON
    GetEmojiSuggestionsUrl
      { language_code = language_code_
      }
        = A.object
          [ "@type"         A..= AT.String "getEmojiSuggestionsUrl"
          , "language_code" A..= language_code_
          ]

