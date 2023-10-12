module TD.Query.GetMessageFileType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetMessageFileType -- ^ Returns information about a file with messages exported from another application
  = GetMessageFileType
    { message_file_head :: Maybe T.Text -- ^ Beginning of the message file; up to 100 first lines
    }
  deriving (Eq)

instance Show GetMessageFileType where
  show
    GetMessageFileType
      { message_file_head = message_file_head_
      }
        = "GetMessageFileType"
          ++ I.cc
          [ "message_file_head" `I.p` message_file_head_
          ]

instance AT.ToJSON GetMessageFileType where
  toJSON
    GetMessageFileType
      { message_file_head = message_file_head_
      }
        = A.object
          [ "@type"             A..= AT.String "getMessageFileType"
          , "message_file_head" A..= message_file_head_
          ]
