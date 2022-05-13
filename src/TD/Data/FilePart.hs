{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.FilePart where

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
      { _data = _data_
      } =
      "FilePart"
        ++ U.cc
          [ U.p "_data" _data_
          ]

instance T.FromJSON FilePart where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "filePart" -> parseFilePart v
      _ -> mempty
    where
      parseFilePart :: A.Value -> T.Parser FilePart
      parseFilePart = A.withObject "FilePart" $ \o -> do
        _data_ <- o A..:? "data"
        return $ FilePart {_data = _data_}
  parseJSON _ = mempty

instance T.ToJSON FilePart where
  toJSON
    FilePart
      { _data = _data_
      } =
      A.object
        [ "@type" A..= T.String "filePart",
          "data" A..= _data_
        ]
