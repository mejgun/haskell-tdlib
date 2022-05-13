{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ConnectedWebsites where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ConnectedWebsite as ConnectedWebsite
import qualified Utils as U

data ConnectedWebsites = -- | Contains a list of websites the current user is logged in with Telegram @websites List of connected websites
  ConnectedWebsites
  { -- |
    websites :: Maybe [ConnectedWebsite.ConnectedWebsite]
  }
  deriving (Eq)

instance Show ConnectedWebsites where
  show
    ConnectedWebsites
      { websites = websites_
      } =
      "ConnectedWebsites"
        ++ U.cc
          [ U.p "websites" websites_
          ]

instance T.FromJSON ConnectedWebsites where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "connectedWebsites" -> parseConnectedWebsites v
      _ -> mempty
    where
      parseConnectedWebsites :: A.Value -> T.Parser ConnectedWebsites
      parseConnectedWebsites = A.withObject "ConnectedWebsites" $ \o -> do
        websites_ <- o A..:? "websites"
        return $ ConnectedWebsites {websites = websites_}
  parseJSON _ = mempty

instance T.ToJSON ConnectedWebsites where
  toJSON
    ConnectedWebsites
      { websites = websites_
      } =
      A.object
        [ "@type" A..= T.String "connectedWebsites",
          "websites" A..= websites_
        ]
