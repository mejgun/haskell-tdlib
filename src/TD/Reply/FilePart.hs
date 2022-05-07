{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.FilePart where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data FilePart = -- | Contains a part of a file @data File bytes
  FilePart
  { -- |
    _data :: Maybe String
  }
  deriving (Eq)

instance Show FilePart where
  show
    FilePart
      { _data = _data
      } =
      "FilePart"
        ++ U.cc
          [ U.p "_data" _data
          ]

instance T.FromJSON FilePart where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "filePart" -> parseFilePart v
      _ -> fail ""
    where
      parseFilePart :: A.Value -> T.Parser FilePart
      parseFilePart = A.withObject "FilePart" $ \o -> do
        _data_ <- o A..:? "data"
        return $ FilePart {_data = _data_}
  parseJSON _ = fail ""

instance T.ToJSON FilePart where
  toJSON
    FilePart
      { _data = _data
      } =
      A.object
        [ "@type" A..= T.String "filePart",
          "data" A..= _data
        ]
