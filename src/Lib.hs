{-# LANGUAGE OverloadedStrings   #-}
{-# LANGUAGE QuasiQuotes         #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Lib
    ( isPostgresRunning
    ) where

import qualified Database.PostgreSQL.Simple       as PG
import           Database.PostgreSQL.Simple.SqlQQ

isPostgresRunning :: IO ()
isPostgresRunning = do
  password <- getLine
  connection <- PG.connect PG.defaultConnectInfo { PG.connectDatabase = ""
                                                 , PG.connectUser = "postgres"
                                                 , PG.connectPort = 5432
                                                 , PG.connectPassword = password
                                                 }
  _ :: [PG.Only Int] <- PG.query_ connection [sql| SELECT 1 |]
  return ()
