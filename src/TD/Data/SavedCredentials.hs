{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.SavedCredentials where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data SavedCredentials = -- | Contains information about saved payment credentials @id Unique identifier of the saved credentials @title Title of the saved credentials
  SavedCredentials
  { -- |
    title :: Maybe String,
    -- |
    _id :: Maybe String
  }
  deriving (Eq)

instance Show SavedCredentials where
  show
    SavedCredentials
      { title = title_,
        _id = _id_
      } =
      "SavedCredentials"
        ++ U.cc
          [ U.p "title" title_,
            U.p "_id" _id_
          ]

instance T.FromJSON SavedCredentials where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "savedCredentials" -> parseSavedCredentials v
      _ -> mempty
    where
      parseSavedCredentials :: A.Value -> T.Parser SavedCredentials
      parseSavedCredentials = A.withObject "SavedCredentials" $ \o -> do
        title_ <- o A..:? "title"
        _id_ <- o A..:? "id"
        return $ SavedCredentials {title = title_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON SavedCredentials where
  toJSON
    SavedCredentials
      { title = title_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "savedCredentials",
          "title" A..= title_,
          "id" A..= _id_
        ]
