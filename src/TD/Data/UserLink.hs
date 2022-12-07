{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.UserLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data UserLink = -- | Contains an HTTPS URL, which can be used to get information about a user @url The URL @expires_in Left time for which the link is valid, in seconds; 0 if the link is a public username link
  UserLink
  { -- |
    expires_in :: Maybe Int,
    -- |
    url :: Maybe String
  }
  deriving (Eq)

instance Show UserLink where
  show
    UserLink
      { expires_in = expires_in_,
        url = url_
      } =
      "UserLink"
        ++ U.cc
          [ U.p "expires_in" expires_in_,
            U.p "url" url_
          ]

instance T.FromJSON UserLink where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "userLink" -> parseUserLink v
      _ -> mempty
    where
      parseUserLink :: A.Value -> T.Parser UserLink
      parseUserLink = A.withObject "UserLink" $ \o -> do
        expires_in_ <- o A..:? "expires_in"
        url_ <- o A..:? "url"
        return $ UserLink {expires_in = expires_in_, url = url_}
  parseJSON _ = mempty

instance T.ToJSON UserLink where
  toJSON
    UserLink
      { expires_in = expires_in_,
        url = url_
      } =
      A.object
        [ "@type" A..= T.String "userLink",
          "expires_in" A..= expires_in_,
          "url" A..= url_
        ]
